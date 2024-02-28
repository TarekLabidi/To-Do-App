import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/utils/palette.dart';

class ChooseHabitIcon extends StatefulWidget {
  final int? dropdownValueIcon;
  final ValueChanged chosed1;
  const ChooseHabitIcon(
      {Key? key, required this.dropdownValueIcon, required this.chosed1})
      : super(key: key);

  @override
  State<ChooseHabitIcon> createState() => _ChooseHabitIconState();
}

class _ChooseHabitIconState extends State<ChooseHabitIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: DropdownButton<int>(
          underline: null,
          elevation: 0,
          style: GoogleFonts.roboto(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          value: widget.dropdownValueIcon,
          iconSize: 20,
          items: const [
            DropdownMenuItem(
              value: 0,
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.suitcase,
                    color: Colors.red,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Work',
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              value: 1,
              child: Row(
                children: [
                  Icon(Icons.flutter_dash,
                      color: Color.fromARGB(255, 14, 230, 246)),
                  SizedBox(width: 4),
                  Text(
                    'Flutter',
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              value: 2,
              child: Row(
                children: [
                  Icon(FontAwesomeIcons.book, color: Palette.purpleColor),
                  SizedBox(width: 4),
                  Text(
                    'Study',
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              value: 3,
              child: Row(
                children: [
                  Icon(FontAwesomeIcons.dumbbell, color: Colors.green),
                  SizedBox(width: 7),
                  Text(
                    'Sport',
                  ),
                ],
              ),
            ),
            DropdownMenuItem(
              value: 4,
              child: Row(
                children: [
                  Icon(Icons.help_outline, color: Colors.amber),
                  SizedBox(width: 7),
                  Text(
                    'Other',
                  ),
                ],
              ),
            ),
          ],
          onChanged: (int? newValue) {
            widget.chosed1(newValue);
          },
        ),
      ),
    );
  }
}
