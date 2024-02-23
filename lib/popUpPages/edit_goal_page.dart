import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/components/tasks_card.dart';
import 'package:to_do_list_app/dummy_data.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_service.dart';
import 'package:to_do_list_app/utils/palette.dart';
import 'package:to_do_list_app/utils/utils.dart';

class EdirtGoalPage extends StatefulWidget {
  const EdirtGoalPage({super.key});

  @override
  State<EdirtGoalPage> createState() => _EdirtGoalPageState();
}

class _EdirtGoalPageState extends State<EdirtGoalPage> {
  final taskNameController = TextEditingController();
  final descNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Palette.purpleColor,
          onPressed: () {
            bool isEmpty = true;

            showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    // ignore: deprecated_member_use
                    return WillPopScope(
                      onWillPop: () async {
                        taskNameController.clear();
                        descNameController.clear();
                        return true; // Allow dialog to be dismissed
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Card(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  SizedBox(
                                    height: height * 0.07,
                                    child: TextField(
                                      controller: taskNameController,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: const TextStyle(fontSize: 18),
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
                                          isEmpty = taskNameController
                                                  .text.isEmpty ||
                                              descNameController.text.isEmpty;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.04,
                                    child: TextField(
                                      controller: descNameController,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: 'Description',
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          isEmpty = taskNameController
                                                  .text.isEmpty ||
                                              descNameController.text.isEmpty;
                                        });
                                      },
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Chip(
                                          label: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            size: 20,
                                            color: Palette.purpleColorscondary,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Today',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 163, 137, 255),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      const Chip(
                                          label: Row(
                                        children: [
                                          Icon(
                                            Icons.flag,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Priority'),
                                        ],
                                      )),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      const Chip(
                                        label: Row(
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.icons,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text('Icon'),
                                          ],
                                        ),
                                      ),
                                    ],
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
                                                desc: descNameController.text,
                                                taskGroup: 'Personal',
                                                category: 'inbox',
                                                time: DateTime.now().toString(),
                                                kind: "Normal",
                                                priority: 4);
                                            Navigator.pop(context);
                                            taskNameController.clear();
                                            descNameController.clear();
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
                          )
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
            size: 35,
            color: Colors.white,
          ),
        ),
        body: Stack(children: [
          Image.asset(
            'assets/images/background.png',
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sameGap2(height),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  SizedBox(
                    width: width / 5.5,
                  ),
                  Text(
                    'Weather App',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  const Icon(
                    Icons.edit,
                    color: Colors.amber,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description :',
                        style: GoogleFonts.roboto(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Description Tarek LAJDPUIQdn DOKNd,qlkdnq ksdlksqd,lkqdnj bqsldnsqljdnlqs,d mkndljqsndqsndkjqsn ;,sdjqshfjkqdf; lmd,f',
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: habits.length,
              //     itemBuilder: (context, index) {
              //       final list = habits[index];
              //       return TasksCard(
              //         height: height,
              //         list: list,
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ]),
      ),
    );
  }
}
