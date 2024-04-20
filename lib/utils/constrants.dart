import 'dart:math';

import 'package:flutter/material.dart';

List<Map<String, dynamic>> musicGenres = [
  {
    "img": "Placeholder Image link for Pop genre",
    "title": "Pop",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Hip-hop genre",
    "title": "Hip-hop",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Electronic genre",
    "title": "Electronic",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for R&B genre",
    "title": "R&B",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Rock genre",
    "title": "Rock",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Indie genre",
    "title": "Indie",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Dance genre",
    "title": "Dance",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Country genre",
    "title": "Country",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Reggae genre",
    "title": "Reggae",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Jazz genre",
    "title": "Jazz",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Blues genre",
    "title": "Blues",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Soul genre",
    "title": "Soul",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Funk genre",
    "title": "Funk",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Gospel genre",
    "title": "Gospel",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Folk genre",
    "title": "Folk",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Metal genre",
    "title": "Metal",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Punk genre",
    "title": "Punk",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Ambient genre",
    "title": "Ambient",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Classical genre",
    "title": "Classical",
    "onTap": () {}
  },
  {
    "img": "Placeholder Image link for Experimental genre",
    "title": "Experimental",
    "onTap": () {}
  },
];
randomdarkColors() => [
      Color(0xFF264653),
      Color(0xFF849324),
      Color(0xFF2a9d8f),
      Color(0xFF23113e),
      Color(0xFFe76f51),
      Color(0xFF7768ae),
    ][Random().nextInt(6)];

List tempLyrics = [
  "Hai katha sangram ki",
  "Vishwa ke kalyan ki",
  "Dharm adharm adi anant",
  "Satya asatya kalesh kalank",
  "swarth ki katha paramarth ki"
];
