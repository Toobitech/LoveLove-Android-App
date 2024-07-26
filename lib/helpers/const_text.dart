import 'package:flutter/material.dart';

Widget boldtext(
  Color tcolor,
  double tsize,
  String text, {
  bool? center,
}) {
  return Text(
    text,
    textAlign: (center == true) ? TextAlign.center : TextAlign.left,
    style: TextStyle(
        color: tcolor,
        fontSize: tsize,
        fontWeight: FontWeight.w900,
        fontFamily: 'caviarbold'),
  );
}

Widget regulartext(Color tcolor, double tsize, String text, {bool? center}) {
  return Text(
    text,
    textAlign: (center == true) ? TextAlign.center : TextAlign.left,
    style: TextStyle(
        color: tcolor,
        fontSize: tsize,
        fontFamily: 'bold',
        fontWeight: FontWeight.normal),
  );
}

Widget mediumtext(Color tcolor, double tsize, String text, {bool? center}) {
  return Text(
    text,
    textAlign: (center == true) ? TextAlign.center : TextAlign.left,
    style: TextStyle(
        color: tcolor,
        fontSize: tsize,
        fontFamily: 'medium',
        fontWeight: FontWeight.w700),
  );
}

Widget lighttext(Color tcolor, double tsize, String text, {bool? center, required }) {
  return Text(
    text,
    textAlign: (center == true) ? TextAlign.center : TextAlign.left,
    style: TextStyle(color: tcolor, fontSize: tsize, fontFamily: 'regular'),
  );
}
