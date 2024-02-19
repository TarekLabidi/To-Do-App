import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/utils/palette.dart';

class FiltersCard extends StatelessWidget {
  const FiltersCard(
      {super.key,
      required this.isPressed,
      required this.filter,
      required this.clicked});

  final bool isPressed;
  final String filter;
  final ValueChanged clicked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clicked(1);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: (isPressed)
              ? Palette.purpleColor
              : const Color.fromRGBO(237, 232, 255, 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 4),
          child: Center(
            child: Text(
              filter,
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: (isPressed) ? FontWeight.bold : FontWeight.w500,
                color: (isPressed)
                    ? Colors.white
                    : Color.fromARGB(255, 146, 128, 203),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
