import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sangeet/controllers/mainController.dart';
import 'package:sangeet/notification.dart';
import 'package:sangeet/tools/spaces.dart';
import 'package:sangeet/utils/constrants.dart';
import 'package:sangeet/widgets/smallWidgets.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({super.key});
  final _playerController = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // if (_playerController.isplaying.value)
        //   SizedBox(
        //     height: 0,
        //     child: YoutubePlayer(
        //       controller: _playerController.player,
        //     ),
        //   ),
        Expanded(
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://ih1.redbubble.net/image.5143920519.6756/flat,750x,075,f-pad,750x1000,f8f8f8.jpg"))),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Colors.black12,
                      Colors.black12,
                      Colors.black54,
                      Colors.black87
                    ])),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                  child: SafeArea(
                      child: Column(
                    children: [
                      VSpacehalf,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              HSpace,
                              IconButton.filledTonal(
                                  onPressed: () => Get.back(),
                                  icon: Icon(Icons.arrow_back_ios_new)),
                            ],
                          ),
                          Text("Playing Now",
                              style: Get.textTheme.headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        " Mahabharat Theme Song",
                        style: Get.textTheme.headlineMedium!
                            .merge(GoogleFonts.openSans()),
                      ),
                      VSpace2,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton.filledTonal(
                              onPressed: () {},
                              icon: Icon(TablerIcons.caret_left)),
                          PlayButton(
                            size: 40,
                          ),
                          IconButton.filledTonal(
                              onPressed: () {},
                              icon: Icon(TablerIcons.caret_right)),
                        ],
                      ),
                      VSpace2,
                      StreamBuilder<Object>(
                          stream: _playerController.player.positionStream,
                          builder: (context, snapshot) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(20),
                                      minHeight: 10,
                                      value: (snapshot.data as Duration)
                                              .inSeconds /
                                          _playerController
                                              .player.duration!.inSeconds,
                                    ),
                                  ),
                                  HSpace,
                                  Text(
                                      "${(snapshot.data as Duration).inMinutes}:${(snapshot.data as Duration).inSeconds % 60}")
                                ],
                              ),
                            );
                          }),
                      VSpacehalf,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton.outlined(
                              onPressed: () async {
                                // await // NotificationController.displayNotificationRationale();
                                //     NotificationController.scheduleNewNotification();
                                _playerController.startplayer();
                              },
                              icon: Icon(TablerIcons.list)),
                          IconButton.outlined(
                              onPressed: () {},
                              icon: Icon(Icons.shuffle_sharp)),
                          IconButton.outlined(
                              onPressed: () {},
                              icon: Icon(TablerIcons.download)),
                          IconButton.outlined(
                              onPressed: () {}, icon: Icon(Icons.more_vert)),
                        ],
                      ),
                      VSpace,
                      SizedBox(
                        height: 200,
                        child: ListWheelScrollView(
                            squeeze: 0.9,
                            diameterRatio: 1.1,
                            itemExtent: 40,
                            children: tempLyrics
                                .map((e) => Text(
                                      e,
                                      style: Get.textTheme.titleLarge,
                                    ))
                                .toList()),
                      ),
                      VSpace2,
                    ],
                  )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
