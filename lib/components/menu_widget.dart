import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/utils/palette.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget(
      {super.key,
      required this.width,
      required this.chosed,
      required this.chosed1,
      required this.dropdownValueString,
      required this.dropdownValueIcon});

  final double width;
  final ValueChanged chosed;
  final ValueChanged chosed1;
  final String? dropdownValueString;
  final IconData? dropdownValueIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: const Chip(
              label: Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 20,
                color: Palette.purpleColorscondary,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Today',
                style: TextStyle(
                    color: Color.fromARGB(255, 163, 137, 255),
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: DropdownButton<String>(
              elevation: 0,
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              value: dropdownValueString,
              iconSize: 20,
              items: const [
                DropdownMenuItem(
                  value: 'Priority 4',
                  child: Row(
                    children: [
                      Icon(
                        Icons.flag,
                        color: Colors.green,
                      ),
                      Text(
                        'Priority 4',
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Priority 3',
                  child: Row(
                    children: [
                      Icon(Icons.flag, color: Color.fromARGB(255, 225, 255, 2)),
                      Text(
                        'Priority 3',
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Priority 2',
                  child: Row(
                    children: [
                      Icon(Icons.flag, color: Color.fromARGB(255, 248, 126, 4)),
                      Text(
                        'Priority 2',
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Priority 1',
                  child: Row(
                    children: [
                      Icon(Icons.flag, color: Colors.red),
                      Text(
                        'Priority 1',
                      ),
                    ],
                  ),
                ),
              ],
              onChanged: (String? newValue) {
                chosed(newValue);
              },
            ),
          ),
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: DropdownButton<IconData>(
              elevation: 0,
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              value: dropdownValueIcon,
              iconSize: 20,
              items: const [
                DropdownMenuItem(
                  value: FontAwesomeIcons.suitcase,
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
                  value: Icons.flutter_dash,
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
                  value: FontAwesomeIcons.book,
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
                  value: FontAwesomeIcons.dumbbell,
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.dumbbell, color: Colors.green),
                      SizedBox(width: 7),
                      Text(
                        'Training',
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: Icons.help_outline,
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
              onChanged: (IconData? newValue) {
                chosed1(newValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}