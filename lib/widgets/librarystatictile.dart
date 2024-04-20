import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sangeet/utils/constrants.dart';
import 'package:tabler_icons/tabler_icons.dart';

class librarystatictile extends StatelessWidget {
  const librarystatictile({
    super.key,
    this.label,
    this.icon,
  });
  final label;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      // color: randomdarkColors(),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 80,
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: ListTile(
              title: Text(
                label,
                style: Get.textTheme.titleLarge,
              ),
              leading: Icon(icon),
              subtitle: Text("📌 : 166 songs"),
            ),
          ),
        ),
      ),
    );
  }
}
