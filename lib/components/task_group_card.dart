import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_service.dart';
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
                  Row(
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      FutureBuilder<int>(
                        future: OnlineStorage().getNumberOfTasks(taskGroup),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return Container(
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
                                    size: 25,
                                    color: context
                                        .read<ToDoProvider>()
                                        .getGroupTaskIconColor(snapshot.data!),
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return const Text('Loading...');
                            }
                          } else {
                            return Text('Loading...');
                          }
                        },
                      )
                    ],
                  ),
                  FutureBuilder<int>(
                    future: OnlineStorage().getNumberOfTasks(taskGroup),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Text(
                            '${snapshot.data} Tasks',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 137, 134, 134),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const Text('Loading...');
                        }
                      } else {
                        return Text('Loading...');
                      }
                    },
                  )
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
