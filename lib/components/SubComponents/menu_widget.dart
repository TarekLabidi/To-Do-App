import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/components/SubComponents/select_time_widget.dart';

import 'package:to_do_list_app/utils/palette.dart';

class MenuWidget extends StatefulWidget {
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
  final int? dropdownValueIcon;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        const SelectTimeWidget(),
        SizedBox(
          width: widget.width * 0.02,
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
              value: widget.dropdownValueString,
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
                widget.chosed(newValue);
              },
            ),
          ),
        ),
        SizedBox(
          width: widget.width * 0.02,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: DropdownButton<int>(
              elevation: 0,
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
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
        ),
      ],
    );
  }
}
