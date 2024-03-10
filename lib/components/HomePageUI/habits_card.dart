import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/services/data/habit_provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_storage.dart';
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
          StreamBuilder(
              stream: OnlineStorage().getPercentageOfHabitTasks(
                  day: DateFormat('EEE').format(DateTime.now())),
              builder: (context, snapshots) {
                if (snapshots.hasError) {
                  return Text(snapshots.error.toString());
                } else if (snapshots.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  final snapshot = snapshots.data;

                  return CircularPercentIndicator(
                    radius: 50.0,
                    lineWidth: 8.0,
                    percent: context
                        .read<HabitsProvider>()
                        .percentageOfHabits(snapshot!),
                    center: Text(
                      "${context.read<HabitsProvider>().percentageOfHabits(snapshot) * 100}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    progressColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 141, 117, 214),
                    reverse: true,
                  );
                }
              })
        ],
      ),
    );
  }
}
