import 'package:flutter/material.dart';
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
      height: MediaQuery.of(context).size.height * 0.1,
      color: Palette.purpleColorscondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: width / 10),
          Text(
            'Daily',
            style: TextStyle(
                color: (rowPosition == 0) ? Palette.purpleColor : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          )
        ],
      ),
    );
  }
}
