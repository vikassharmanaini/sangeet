import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sangeet/controllers/mainController.dart';
import 'package:sangeet/utils/constrants.dart';
import 'package:sangeet/widgets/widget.dart';
import 'package:tabler_icons/tabler_icons.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
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
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(TablerIcons.search)),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding:
                      EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  title: Text("Search"),
                ),
              ),
              SliverGrid.builder(
                  itemCount: musicGenres.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 120),
                  itemBuilder: (_, index) => Card(
                        color: randomdarkColors(),
                        margin: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            musicGenres[index]['title'],
                            style: Get.textTheme.titleLarge,
                          ),
                        ),
                      ))
            ],
          ),
          bottomNavigationBar: BottomNav(
            index: 1,
          ),
        ),
      ],
    );
  }
}
