import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

sameGap(double height) {
  return SizedBox(
    height: height / 40,
  );
}

sameGap2(double height) {
  return SizedBox(
    height: height / 30,
  );
}

containerIcon(double height, double width, IconData icon, double iconSize,
    Color colorPrimary, Color colorSecondary) {
  return Container(
    width: height,
    height: width,
    decoration: BoxDecoration(
      color: colorSecondary,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Icon(
        icon,
        size: iconSize,
        color: colorPrimary,
      ),
    ),
  );
}
