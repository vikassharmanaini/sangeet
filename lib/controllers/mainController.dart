import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainController extends GetxController {
  RxBool isplaying = true.obs;
  AudioPlayer player = AudioPlayer();
  // YoutubePlayerController player =
  //     YoutubePlayerController(initialVideoId: 'dwupdlvO74U');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // player.addListener(() {
    //   if (!player.value.isPlaying) {
    //     // AwesomeNotifications().
    //     notify((player.value.position.inSeconds /
    //             player.value.metaData.duration.inSeconds) *
    //         100);
    //   }
    // });
  }

  notify(s) async {
    // log(s);
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'alerts',
          title: 'Now Playing',
          body: 'Song Name - Artist Name',
          progress: s ?? 59,
          autoDismissible: false,
          playbackSpeed: 900,
          notificationLayout: NotificationLayout.ProgressBar,
          playState: NotificationPlayState.playing,
          bigPicture:
              'https://i.pinimg.com/736x/24/51/f2/2451f2079733dc02e5d1b4009bfc857b.jpg'
          // actions: [
          //   NotificationActionButton(
          //     key: 'play',
          //     label: 'Play',
          //     enabled: true,
          //   ),
          //   NotificationActionButton(
          //     key: 'pause',
          //     label: 'Pause',
          //     enabled: true,
          //   ),
          //   NotificationActionButton(
          //     key: 'stop',
          //     label: 'Stop',
          //     enabled: true,
          //   ),
          // ],
          ),
    );
  }

  startplayer() async {
    // notify(20.8);
    // await Future.delayed(Duration(seconds: 2), () {
    //   notify(80.8);
    // });
    downloadAndConvertToMP3("hgh");

    // log(player.value.position.inSeconds.toString());
  }

  downloadAndConvertToMP3(String videoUrl) async {
    final id = "0MBS7hEWdZ0";
    var youtube = YoutubeExplode();
    var manifest = await youtube.videos.streamsClient.getManifest(id);
    var audioStreamInfo = manifest.audioOnly.first;
    var audioStreamUrl = audioStreamInfo.url;
    log(audioStreamUrl.toString());
    try {
      await player.setUrl(audioStreamUrl.toString());
      player.play();
    } catch (d) {
      log(d.toString());
    }
  }
}
