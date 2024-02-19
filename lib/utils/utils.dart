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

containerIcon(double height, double width, IconData icon, double iconSize) {
  return Container(
    width: height,
    height: width,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 208, 232),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Icon(
        icon,
        size: iconSize,
        color: const Color.fromARGB(255, 238, 58, 151),
      ),
    ),
  );
}
