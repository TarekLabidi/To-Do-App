import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/components/SubComponents/add_habbit_menu_widget.dart';
import 'package:to_do_list_app/services/data/habit_provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/models/habbit_model.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_storage.dart';
import 'package:to_do_list_app/utils/palette.dart';

class HabitsFloatingButton extends StatefulWidget {
  const HabitsFloatingButton(
      {super.key,
      required this.height,
      required this.width,
      required this.habit});

  final double height;
  final double width;
  final Habbit habit;

  @override
  State<HabitsFloatingButton> createState() => _HabitsFloatingButtonState();
}

class _HabitsFloatingButtonState extends State<HabitsFloatingButton> {
  final taskNameController = TextEditingController();
  String? dropdownValuePriority = 'Priority 4';
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Palette.purpleColor,
      shape: const CircleBorder(),
      onPressed: () {
        bool isEmpty = true;
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return WillPopScope(
                  onWillPop: () async {
                    taskNameController.clear();
                    context.read<HabitsProvider>().resetDays();
                    return true;
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: widget.height * 0.01,
                              ),
                              SizedBox(
                                height: widget.height * 0.12,
                                child: TextField(
                                  maxLines: 2,
                                  controller: taskNameController,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: const TextStyle(fontSize: 18),
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.none,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  decoration: const InputDecoration(
                                    hintText: 'Habit Name',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      isEmpty = taskNameController.text.isEmpty;
                                    });
                                  },
                                ),
                              ),
                              AddHabbitMenuWidget(
                                width: widget.width,
                                dropdownValueString: dropdownValuePriority,
                                chosed: (value) {
                                  setState(() {
                                    dropdownValuePriority = value;
                                  });
                                },
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              SizedBox(height: widget.height * 0.01),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      if (!isEmpty) {
                                        OnlineStorage().createHabitTask(
                                            title: taskNameController.text,
                                            habit: widget.habit.title,
                                            priority: dropdownValuePriority!,
                                            icon: widget.habit.icon,
                                            time: context
                                                .read<HabitsProvider>()
                                                .time,
                                            days: context
                                                .read<HabitsProvider>()
                                                .days);
                                        Navigator.pop(context);
                                        taskNameController.clear();

                                        context
                                            .read<HabitsProvider>()
                                            .resetDays();
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: (!isEmpty)
                                              ? Palette.purpleColor
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.arrow_forward_sharp,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      child: const Icon(
        Icons.add,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
