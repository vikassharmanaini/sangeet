import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArtistList extends StatelessWidget {
  const ArtistList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, //art
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://xsgames.co/randomusers/assets/avatars/male/$index.jpg'),
                      ),
                    ),
                    Text("Artist ${index + 1}",
                        style: Theme.of(context).textTheme.labelLarge)
                  ],
                )));
  }
}
