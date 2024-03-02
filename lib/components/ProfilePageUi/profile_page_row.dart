import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/utils/palette.dart';

class GoalsPageRow extends StatelessWidget {
  final int rowPosition;
  final ValueChanged clicked;
  const GoalsPageRow(
      {super.key, required this.rowPosition, required this.clicked});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      color: Color.fromARGB(255, 202, 204, 255),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: width / 5),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              GestureDetector(
                onTap: () {
                  clicked(0);
                },
                child: Text(
                  'Daily',
                  style: GoogleFonts.roboto(
                      color: (rowPosition == 0)
                          ? Palette.purpleColor
                          : Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
              ),
              Spacer(),
              Visibility(
                visible: (rowPosition == 0),
                child: Container(
                  width: 47,
                  height: 3,
                  color: Palette.purpleColor,
                ),
              ),
            ],
          ),
          SizedBox(width: width / 3),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              GestureDetector(
                onTap: () {
                  clicked(1);
                },
                child: Text(
                  'Weekly',
                  style: GoogleFonts.roboto(
                      color: (rowPosition == 1)
                          ? Palette.purpleColor
                          : const Color.fromARGB(255, 117, 117, 117),
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
              ),
              Spacer(),
              Visibility(
                visible: (rowPosition == 1),
                child: Container(
                  width: 47,
                  height: 3,
                  color: Palette.purpleColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
