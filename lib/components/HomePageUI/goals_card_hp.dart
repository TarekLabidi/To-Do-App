import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/services/data/goal_provider.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/goal_moddel.dart';
import 'package:to_do_list_app/utils/utils.dart';

class GoalssCardHp extends StatelessWidget {
  final Goal goal;
  final int index;
  const GoalssCardHp({super.key, required this.goal, required this.index});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return (context
            .read<GoalsProvider>()
            .isInProgress(goal.startDay, goal.endDay))
        ? Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 14),
            child: Container(
              height: double.infinity,
              width: width * 0.57,
              decoration: BoxDecoration(
                color: context.read<GoalsProvider>().getGoalCardColor(index),
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          context.read<ToDoProvider>().getCategory(goal.icon),
                          style: GoogleFonts.lato(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 139, 137, 137),
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        containerIcon(
                            50,
                            50,
                            context.read<ToDoProvider>().getIcon(goal.icon),
                            30,
                            context
                                .read<GoalsProvider>()
                                .getGoalCardPercentageColor(index),
                            Colors.transparent)
                      ],
                    ),
                    SizedBox(height: height / 100),
                    Text(
                      goal.title,
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    LinearPercentIndicator(
                      width: width * 0.47,
                      lineHeight: 14.0,
                      percent: context
                          .read<GoalsProvider>()
                          .calDays(goal.startDay, goal.endDay),
                      backgroundColor: const Color.fromARGB(255, 236, 243, 250),
                      progressColor: context
                          .read<GoalsProvider>()
                          .getGoalCardPercentageColor(index),
                      padding: const EdgeInsets.only(top: 5),
                      barRadius: const Radius.circular(5),
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
