import 'package:flutter/material.dart';
import 'package:get/get.dart';

class titlelabel extends StatelessWidget {
  const titlelabel({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Get.textTheme.titleLarge,
          ),
          Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}
