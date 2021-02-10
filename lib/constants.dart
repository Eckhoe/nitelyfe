import 'package:flutter/material.dart';

const kNiteLyfeRed = Color(0xFFD51C1C);

const kMessageBackgroundColor = Color(0xFFf1f1f1);

const kNiteLyfePlusTextStyle =
    TextStyle(color: kNiteLyfeRed, fontFamily: 'Comfortaa', fontSize: 28);

const kTextFieldDecoraton = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kListTileStyle = TextStyle(
  fontFamily: 'Comfortaa',
  fontWeight: FontWeight.normal,
  fontSize: 20,
);
