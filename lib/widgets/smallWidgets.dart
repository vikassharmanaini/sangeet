import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sangeet/utils/routes.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key,this.size});
final double? size;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      iconSize: size,
        onPressed: () =>Get.toNamed(AppRoutes.player), icon: Icon(Icons.play_arrow_rounded));
  }
}
