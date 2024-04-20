import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sangeet/controllers/mainController.dart';
import 'package:sangeet/tools/spaces.dart';
import 'package:sangeet/widgets/playing.dart';
import './../widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = ScrollController();
  final _playerController = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          body: CustomScrollView(
            controller: controller,
            slivers: [
              SliverAppBar.medium(
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  title: Text(
                    "Sangeet",
                    style: GoogleFonts.pacifico(),
                  ),
                ),
                actions: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://xsgames.co/randomusers/assets/avatars/female/70.jpg"),
                  ),
                  HSpace,
                  HSpacehalf,
                ],
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titlelabel(
                        title: "Recommend for You",
                      ),
                      VSpace,
                      recomendations(),
                      VSpacehalf,
                      titlelabel(
                        title: "Recent",
                      ),
                      VSpace,
                      RecentList(),
                      titlelabel(
                        title: "Artists",
                      ),
                      VSpace,
                      ArtistList(),
                    ],
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: BottomNav(
            index: 0,
          ),
        ),
        playing(),
      ],
    );
  }
}
