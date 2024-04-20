import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sangeet/widgets/noresults.dart';
import 'package:sangeet/widgets/widget.dart';

class DownloadScreens extends StatelessWidget {
  const DownloadScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  title: Text("Downloads"),
                ),
              ),
              SliverList.builder(
                  itemCount: 15,
                  itemBuilder: (_, i) => Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: ListTile(
                          leading: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://picsum.photos/id/${30 + i}/200/300"),
                              ),
                              if (i == 3)
                                Icon(
                                  CupertinoIcons.pause_circle_fill,
                                  color: Get.theme.indicatorColor,
                                )
                            ],
                          ),
                          trailing: Text("03:22"),
                          title: Text("Song Name"),
                          subtitle: Text("Song Artist Name1, Artist 2"),
                        ),
                      ))
              // SliverFillRemaining(
              //   child: NoResults(),
              // )
            ],
          ),
          bottomNavigationBar: BottomNav(
            index: 3,
          ),
        ),
      ],
    );
  }
}
