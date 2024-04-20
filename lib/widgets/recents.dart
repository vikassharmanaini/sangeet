import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sangeet/widgets/widget.dart';

class RecentList extends StatelessWidget {
  const RecentList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemExtent: 170,
          itemBuilder: (c, i) => Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        width: 150,
                        height: 140,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                          "https://picsum.photos/id/${80 + i}/200/300",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(right: -10, bottom: -5, child: PlayButton())
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      "Music Name",
                      style: Get.textTheme.titleSmall!.merge(
                          GoogleFonts.anekLatin(fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Text(
                      "Artist 1, Artist 2",
                      style: Get.textTheme.titleSmall!.merge(
                          GoogleFonts.anekLatin(
                              fontWeight: FontWeight.w600,
                              color: Colors.white38)),
                    ),
                  ),
                ],
              )),
    );
  }
}
