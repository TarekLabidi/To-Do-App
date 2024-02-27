import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/components/number_of_tasks_in_task_group_card.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/utils/utils.dart';

class TaskGroupCard extends StatelessWidget {
  final String taskGroup;
  const TaskGroupCard({super.key, required this.taskGroup});

  @override
  Widget build(BuildContext context) {
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
                  NumberOfTasksInTaskGroupCard(taskGroup: taskGroup)
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
