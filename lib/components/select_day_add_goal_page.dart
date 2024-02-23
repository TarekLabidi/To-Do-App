import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/utils/palette.dart';

class SelectDayAddGoalPage extends StatelessWidget {
  const SelectDayAddGoalPage(
      {super.key, required this.width, required this.title});

  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const FaIcon(
              FontAwesomeIcons.solidCalendarDays,
              size: 30,
              color: Palette.purpleColorscondary,
            ),
            SizedBox(width: width * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Choose your start date',
                  style: GoogleFonts.roboto(fontSize: 16, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
