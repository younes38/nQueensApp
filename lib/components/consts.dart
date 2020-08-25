import 'package:flutter/material.dart';

const Color color = Colors.black;
const backgroudDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/chess_wallpaper.jpg'),
    colorFilter: const ColorFilter.mode(
      color,
      BlendMode.dstATop,
    ),
    fit: BoxFit.cover,
  ),
);
