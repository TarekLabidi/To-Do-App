import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/components/Goals&HabitsPageUi/habbit_task_card.dart';

import 'package:to_do_list_app/components/Goals&HabitsPageUi/habbits_floating_button.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/habbit_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/habbit_task_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_storage.dart';

import 'package:to_do_list_app/utils/utils.dart';

class HabitTaskspage extends StatelessWidget {
  final Habbit habit;

  const HabitTaskspage({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: HabitsFloatingButton(
          height: height,
          width: width,
          habit: habit,
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
                          habit.title,
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
                        context.read<ToDoProvider>().getIcon(habit.icon),
                        40,
                        context.read<ToDoProvider>().getColorPrimaryWithName(
                            context
                                .read<ToDoProvider>()
                                .getCategory(habit.icon)),
                        context.read<ToDoProvider>().getColorSecondaryWithName(
                            context
                                .read<ToDoProvider>()
                                .getCategory(habit.icon)),
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
                            habit.desc,
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  sameGap2(height),
                  StreamBuilder<List<HabbitTask>>(
                    stream: OnlineStorage().getHabitTasks(habit: habit.title),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final habitTasks = snapshot.data;

                        return ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: habitTasks!.map(buildHabitTask).toList(),
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

  Widget buildHabitTask(HabbitTask habitTask) => HabbitTasksCard(
        habbitTask: habitTask,
      );
}
