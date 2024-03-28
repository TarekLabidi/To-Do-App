import 'package:flutter/material.dart';
import 'package:to_do_list_app/components/DeletedPageUi/deleted_goal_task_card.dart';
import 'package:to_do_list_app/components/DeletedPageUi/deleted_task_card.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/goal_task_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/task_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_storage.dart';
import 'package:to_do_list_app/utils/utils.dart';

class DeletedTasksPage extends StatefulWidget {
  const DeletedTasksPage({super.key});

  @override
  State<DeletedTasksPage> createState() => _DeletedTasksPageState();
}

class _DeletedTasksPageState extends State<DeletedTasksPage> {
  bool isDeletedTasksShown = false;
  bool isDeletedGoalTasksShown = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/background.png',
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                sameGap(height),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.01,
                    ),
                    IconButton(
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                        icon: const Icon(Icons.arrow_back)),
                    SizedBox(
                      width: width * 0.22,
                    ),
                    Text(
                      'Deleted',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                        'Deleted Tasks',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isDeletedTasksShown = !isDeletedTasksShown;
                          });
                        },
                        icon: RotatedBox(
                          quarterTurns: (isDeletedTasksShown) ? -1 : 1,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                (isDeletedTasksShown)
                    ? StreamBuilder(
                        stream: OnlineStorage().getDeletedTasks(),
                        builder: (context, snapshots) {
                          if (snapshots.hasData) {
                            final groupTasks = snapshots.data!;
                            return ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: groupTasks
                                  .map((taskGroup) =>
                                      buildDeletedTask(taskGroup))
                                  .toList(),
                            );
                          } else if (snapshots.hasError) {
                            return Center(
                              child: Text(
                                snapshots.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      )
                    : const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                        'Deleted GoalTasks',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isDeletedGoalTasksShown = !isDeletedGoalTasksShown;
                          });
                        },
                        icon: RotatedBox(
                          quarterTurns: (isDeletedGoalTasksShown) ? -1 : 1,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                (isDeletedGoalTasksShown)
                    ? StreamBuilder(
                        stream: OnlineStorage().getDeletedGoalTasks(),
                        builder: (context, snapshots) {
                          if (snapshots.hasData) {
                            print('object');
                            final groupTasks = snapshots.data!;
                            return ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: groupTasks
                                  .map((goalTask) =>
                                      buildDeletedGoalTask(goalTask))
                                  .toList(),
                            );
                          } else if (snapshots.hasError) {
                            return Center(
                              child: Text(
                                snapshots.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildDeletedTask(Task task) => DeletedTasksCard(task: task);
  Widget buildDeletedGoalTask(GoalTask goalTask) =>
      DeletedGoalTasksCardTP(goalTask: goalTask);
}
