import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sangeet/controllers/mainController.dart';
import 'package:sangeet/tools/spaces.dart';
import 'package:sangeet/utils/routes.dart';
import 'package:sangeet/widgets/smallWidgets.dart';
import 'package:tabler_icons/tabler_icons.dart';

class PlayListScreen extends StatelessWidget {
PlayListScreen({super.key});
  final _playerController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          body: Stack(
            children: [
              Container(
                width: Get.width,
                height: 400,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 3,
                      sigmaY: 3),
                  child: SafeArea(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton.filledTonal(
                            onPressed: () => Get.back(),
                            icon: Icon(Icons.arrow_back_ios_new_rounded)),
                      )
                    ],
                  )),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://i.ytimg.com/vi/PT2_F-1esPk/maxresdefault.jpg"))),
              ),
              DraggableScrollableSheet(
                maxChildSize: (Get.height - 150) / Get.height,
                initialChildSize: (Get.height - 300) / Get.height,
                minChildSize: (Get.height - 300) / Get.height,
                builder: (context, scrollController) => Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 20,
                          ),
                          Positioned(
                            top: -80,
                            child: Container(
                              width: 120,
                              height: 120,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.network(
                                  fit: BoxFit.cover,
                                  "https://i.ytimg.com/vi/PT2_F-1esPk/maxresdefault.jpg"),
                            ),
                          )
                        ],
                      ),
                      VSpace,
                      Text(
                        "PlayList Title Name",
                        style: Get.textTheme.titleLarge,
                      ),
                      VSpacehalf,
                      Text(
                        "Marshmello & Anne-Marie - FRIENDS (Music Video) OFFICIAL FRIENDZONE ANTHEM Stream/Download: https://marshmello.ffm.to/friends",
                        style: Get.textTheme.bodyMedium!
                            .copyWith(color: Colors.white38),
                        textAlign: TextAlign.center,
                      ),
                      VSpacehalf,
                      Row(
                        children: [
                          HSpace2,
                          Icon(Icons.favorite_border),
                          HSpace2,
                          Icon(TablerIcons.download),
                          Spacer(),
                          PlayButton(),
                          HSpace2,
                        ],
                      ),
                      VSpacehalf,
                      Divider(),
                      Expanded(
                          child: ListView.builder(
                              controller: scrollController,
                              itemCount: 20,
                              itemBuilder: (_, i) => Card(
                                    child: ListTile(
                                        title: Row(
                                          children: [
                                            Card(
                                              clipBehavior: Clip.hardEdge,
                                              child: Image.network(
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.cover,
                                                  "https://picsum.photos/id/${9 * i}/200/300"),
                                            ),
                                            HSpace2,
                                            Text("Song Name $i"),
                                          ],
                                        ),
                                        leading: Text("${i + 1})")),
                                  )))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
