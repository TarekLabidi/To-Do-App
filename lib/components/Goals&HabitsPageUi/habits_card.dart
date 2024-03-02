import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:to_do_list_app/utils/palette.dart';

class HabitsCard extends StatelessWidget {
  const HabitsCard({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 5,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Palette.purpleColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 46,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Your Today\'s Habits \n',
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    children: const [TextSpan(text: 'almost done!')],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: width / 3.5,
                    height: height / 18,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'View Habits',
                        style: TextStyle(
                            color: Palette.purpleColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height / 36),
              ],
            ),
          ),
          SizedBox(width: width / 26),
          CircularPercentIndicator(
            radius: 50.0,
            lineWidth: 8.0,
            percent: .60,
            center: const Text(
              "100%",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            progressColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 141, 117, 214),
            reverse: true,
          )
        ],
      ),
    );
  }
}
