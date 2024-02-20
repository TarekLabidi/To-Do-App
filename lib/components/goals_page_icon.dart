import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/utils/palette.dart';

class GoalsPageIcon extends StatelessWidget {
  const GoalsPageIcon({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 30,
          color: Palette.purpleColor,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: GoogleFonts.roboto(fontSize: 22),
        )
      ],
    );
  }
}
