import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/components/Goals&HabitsPageUi/goal_floating_button.dart';
import 'package:to_do_list_app/components/Goals&HabitsPageUi/goal_task_card.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/goal_moddel.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/goal_task_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_storage.dart';
import 'package:to_do_list_app/utils/palette.dart';
import 'package:to_do_list_app/utils/utils.dart';

class GoalTaskspage extends StatelessWidget {
  final Goal goal;

  const GoalTaskspage({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: GoalsFloationgButton(
          goal: goal,
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/background.png',
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  sameGap2(height),
                  Row(
                    children: [
                      SizedBox(width: width * 0.05),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      SizedBox(
                        width: 180,
                        height: 30,
                        child: Text(
                          goal.title,
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      containerIcon(
                        50,
                        50,
                        context.read<ToDoProvider>().getIcon(goal.icon),
                        40,
                        context.read<ToDoProvider>().getColorPrimaryWithName(
                            context
                                .read<ToDoProvider>()
                                .getCategory(goal.icon)),
                        context.read<ToDoProvider>().getColorSecondaryWithName(
                            context
                                .read<ToDoProvider>()
                                .getCategory(goal.icon)),
                      ),
                      const SizedBox(width: 20)
                    ],
                  ),
                  sameGap2(height),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description :',
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            goal.desc,
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Start Day : ${goal.startDay}',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Palette.greyColor),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'End Day : ${goal.endDay}',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Palette.greyColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  sameGap2(height),
                  StreamBuilder<List<GoalTask>>(
                    stream: OnlineStorage().getGoalTasks(goal: goal.title),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final habitTasks = snapshot.data;

                        return ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: habitTasks!.map(buildGoalTask).toList(),
                        );
                      } else if (snapshot.hasError) {
                        return Column(
                          children: [
                            Text(
                              snapshot.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGoalTask(GoalTask goalTask) => GoalTasksCard(
        goalTask: goalTask,
      );
}
