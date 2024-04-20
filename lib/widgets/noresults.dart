import 'package:flutter/material.dart';

class NoResults extends StatelessWidget {
  const NoResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
        fit: BoxFit.cover,
        "https://i0.wp.com/codemyui.com/wp-content/uploads/2016/10/flying-ghosts-for-halloween-themed-websites.gif?fit=880%2C440&ssl=1");
  }
}
