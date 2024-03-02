import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/components/HomePageUI/number_of_tasks_in_task_group_card.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_storage.dart';
import 'package:to_do_list_app/utils/utils.dart';

class TaskGroupCard extends StatelessWidget {
  final String taskGroup;
  const TaskGroupCard({super.key, required this.taskGroup});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskGroup,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  NumberOfTasksInTaskGroupCard(taskGroup: taskGroup),
                  FutureBuilder(
                    future: OnlineStorage().getNumberOfTasks(taskGroup),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return LinearPercentIndicator(
                            width: width * 0.47,
                            lineHeight: 14.0,
                            percent: context
                                .watch<ToDoProvider>()
                                .geTaskGroupPercentage(snapshot.data!),
                            backgroundColor:
                                const Color.fromARGB(255, 236, 243, 250),
                            progressColor: context
                                .read<ToDoProvider>()
                                .getGroupTaskIconColor(snapshot.data!),
                            padding: const EdgeInsets.only(top: 5),
                            barRadius: const Radius.circular(5),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const Text('Loading...');
                        }
                      } else {
                        return const Text('Loading...');
                      }
                    },
                  ),
                ],
              ),
              const Spacer(),
              containerIcon(
                  40,
                  40,
                  context.read<ToDoProvider>().getIconWithName(taskGroup),
                  30,
                  context
                      .read<ToDoProvider>()
                      .getColorPrimaryWithName(taskGroup),
                  context
                      .read<ToDoProvider>()
                      .getColorSecondaryWithName(taskGroup)),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
