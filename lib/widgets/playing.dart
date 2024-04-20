import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sangeet/widgets/widget.dart';

import '../controllers/mainController.dart';

class playing extends StatelessWidget {
 playing({
    super.key,
  });
  final _playerController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(bottom: 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage("https://i.ibb.co/1r81tnB/logo.png"),
            ),
            trailing: PlayButton(),
            title: Text("Song Name"),
            subtitle: Text("Song Artist Name"),
          ),
          LinearProgressIndicator(
            value: 0.4,
          )
        ],
      ),
    );
  }
}
