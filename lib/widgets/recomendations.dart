import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class recomendations extends StatelessWidget {
  const recomendations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemExtent: 170,
          itemBuilder: (c, i) => Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 150,
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.network(
                      "https://picsum.photos/id/${20 + i}/200/300",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 140,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        "Music Name",
                        style: Get.textTheme.titleSmall!.merge(
                            GoogleFonts.anekLatin(fontWeight: FontWeight.w600)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.transparent,
                          Colors.black12,
                          Colors.black54,
                        ])),
                  )
                ],
              )),
    );
  }
}
