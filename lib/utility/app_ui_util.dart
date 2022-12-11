import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

Text customText1(String text, color, double size,
    {indent = TextAlign.start, fontWeight = FontWeight.normal, maxLines = 2,
    darkModeOn=false}) {
  return Text(
    text,
    textAlign: indent,
    maxLines: maxLines,
    style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: darkModeOn
            ? Colors.white
            : Colors.black),
  );
}