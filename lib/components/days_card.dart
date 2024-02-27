import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/utils/palette.dart';

class DaysCard extends StatelessWidget {
  const DaysCard(
      {super.key,
      required this.height,
      required this.width,
      required this.isPressed,
      required this.clicked,
      required this.index,
      required this.changeDate});

  final double height;
  final double width;
  final int index;
  final bool isPressed;
  final ValueChanged clicked;
  final ValueChanged changeDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clicked(5);
        changeDate(DateFormat("dd MM yyyy")
            .format(DateTime.now().subtract(Duration(days: 2 - index))));
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
                DateFormat("MMM").format(DateTime.now()),
                style: GoogleFonts.lato(
                    color: (isPressed)
                        ? const Color.fromARGB(255, 241, 239, 239)
                        : Colors.black,
                    fontSize: 16),
              ),
              const Spacer(),
              Text(
                DateFormat("dd")
                    .format(DateTime.now().subtract(Duration(days: 2 - index))),
                style: GoogleFonts.lato(
                    color: (isPressed)
                        ? const Color.fromARGB(255, 241, 239, 239)
                        : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              const Spacer(),
              Text(
                DateFormat('EEE')
                    .format(DateTime.now().subtract(Duration(days: 2 - index))),
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
