import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/utils/palette.dart';

class DaysCard extends StatelessWidget {
  const DaysCard(
      {super.key,
      required this.height,
      required this.width,
      required this.isPressed,
      required this.clicked});

  final double height;
  final double width;
  final bool isPressed;
  final ValueChanged clicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clicked(5);
      },
      child: Container(
        height: height / 8,
        width: width / 5 - 12,
        decoration: BoxDecoration(
            color: (isPressed)
                ? Palette.purpleColor
                : const Color.fromARGB(255, 241, 239, 239),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color.fromARGB(255, 209, 206, 206))),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'May',
                style: GoogleFonts.lato(
                    color: (isPressed)
                        ? const Color.fromARGB(255, 241, 239, 239)
                        : Colors.black,
                    fontSize: 16),
              ),
              const Spacer(),
              Text(
                '25',
                style: GoogleFonts.lato(
                    color: (isPressed)
                        ? const Color.fromARGB(255, 241, 239, 239)
                        : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              const Spacer(),
              Text(
                'Sun',
                style: GoogleFonts.lato(
                    color: (isPressed)
                        ? const Color.fromARGB(255, 241, 239, 239)
                        : Colors.black,
                    fontSize: 14),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
