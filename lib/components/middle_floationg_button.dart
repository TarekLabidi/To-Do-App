import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/components/menu_widget.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_service.dart';
import 'package:to_do_list_app/utils/palette.dart';

class MiddleFloationgButton extends StatefulWidget {
  const MiddleFloationgButton({
    super.key,
  });

  @override
  State<MiddleFloationgButton> createState() => _MiddleFloationgButtonState();
}

class _MiddleFloationgButtonState extends State<MiddleFloationgButton> {
  String? dropdownValuePriority = 'Priority 4';
  int? dropdownValueIcon = 1;
  final taskNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return FloatingActionButton(
      elevation: 30,
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

                    context.read<ToDoProvider>().disposeVars();
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
                                height: height * 0.01,
                              ),
                              SizedBox(
                                height: height * 0.12,
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
                                    hintText: 'Task Name',
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
                              MenuWidget(
                                width: width,
                                dropdownValueIcon: dropdownValueIcon,
                                dropdownValueString: dropdownValuePriority,
                                chosed: (value) {
                                  setState(() {
                                    dropdownValuePriority = value;
                                  });
                                },
                                chosed1: (value) {
                                  setState(() {
                                    dropdownValueIcon = value;
                                  });
                                },
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              SizedBox(height: height * 0.01),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.inbox_outlined,
                                        size: 25,
                                        color: Palette.purpleColor,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Inbox',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      if (!isEmpty) {
                                        OnlineStorage().createTask(
                                            title: taskNameController.text,
                                            taskGroup: 'Personal',
                                            kind: 'To Do',
                                            category: context
                                                .read<ToDoProvider>()
                                                .getCategory(
                                                    dropdownValueIcon!),
                                            priority: int.parse(
                                                dropdownValuePriority![9]),
                                            date: context
                                                .read<ToDoProvider>()
                                                .getDate(),
                                            icon: dropdownValueIcon!);
                                        Navigator.pop(context);
                                        taskNameController.clear();

                                        context
                                            .read<ToDoProvider>()
                                            .disposeVars();
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
