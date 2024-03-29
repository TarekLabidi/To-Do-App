import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/goal_task_model.dart';
import 'package:to_do_list_app/utils/palette.dart';

class GoalTasksCard extends StatefulWidget {
  final GoalTask goalTask;
  const GoalTasksCard({super.key, required this.goalTask});

  @override
  State<GoalTasksCard> createState() => _GoalTasksCardState();
}

class _GoalTasksCardState extends State<GoalTasksCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height / 7,
      margin: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(255, 245, 245, 245),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: context
                          .read<ToDoProvider>()
                          .getPrioritySecondary(widget.goalTask.priority),
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.flag,
                    size: 25,
                    color: context
                        .read<ToDoProvider>()
                        .getPriority(widget.goalTask.priority),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            Text(
              widget.goalTask.title,
              style:
                  GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.solidClock,
                      color: Palette.purpleColorscondary,
                      size: 15,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.goalTask.date.substring(0, 6),
                      style: GoogleFonts.lato(
                        color: Palette.purpleColorscondary,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}
