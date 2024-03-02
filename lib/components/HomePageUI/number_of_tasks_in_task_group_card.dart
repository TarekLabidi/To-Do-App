import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_storage.dart';

class NumberOfTasksInTaskGroupCard extends StatelessWidget {
  const NumberOfTasksInTaskGroupCard({
    super.key,
    required this.taskGroup,
  });

  final String taskGroup;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: OnlineStorage().getNumberOfTasks(taskGroup),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Row(
              children: [
                Text(
                  '${snapshot.data} Tasks',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 137, 134, 134),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                      color: context
                          .read<ToDoProvider>()
                          .getGroupTaskColor(snapshot.data!),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      context
                          .read<ToDoProvider>()
                          .getGroupTaskIcon(snapshot.data!),
                      size: 20,
                      color: context
                          .read<ToDoProvider>()
                          .getGroupTaskIconColor(snapshot.data!),
                    ),
                  ),
                )
              ],
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
    );
  }
}
