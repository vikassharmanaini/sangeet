import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sangeet/tools/spaces.dart';
import 'package:sangeet/utils/constrants.dart';
import 'package:sangeet/utils/routes.dart';
import 'package:sangeet/widgets/widget.dart';
import 'package:tabler_icons/tabler_icons.dart';

import '../controllers/mainController.dart';

class LibraryScreen extends StatelessWidget {
   LibraryScreen({super.key});
  final _playerController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar.medium(
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  title: Text("My Library"),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate.fixed(<Widget>[
                librarystatictile(
                  label: "Liked Songs",
                  icon: Icons.favorite_outline,
                ),
                VSpace,
                librarystatictile(
                  label: "Shared Songs",
                  icon: Icons.bookmark_outline_rounded,
                ),
                VSpace,
                Divider(
                  endIndent: 30,
                  indent: 30,
                ),
                VSpace,
                for (int i in List.generate(15, (index) => index))
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    child: ListTile(
                      onTap: () => Get.toNamed(AppRoutes.playlist),
                      title: Text("PlayList Name $i"),
                      subtitle: Text("${97 * i} Songs"),
                      leading: Image.network(
                          width: 50,
                          height: 70,
                          fit: BoxFit.cover,
                          "https://picsum.photos/id/${9 * i}/200/300"),
                    ),
                  )
              ]))
            ],
          ),
          bottomNavigationBar: BottomNav(
            index: 2,
          ),
        ),
      ],
    );
  }
}
