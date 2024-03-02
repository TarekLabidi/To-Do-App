import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/components/Goals&HabitsPageUi/add_goal_container.dart';
import 'package:to_do_list_app/components/Goals&HabitsPageUi/choose_habit_icon.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_storage.dart';

import 'package:to_do_list_app/utils/palette.dart';
import 'package:to_do_list_app/utils/utils.dart';

class AddHabbitPage extends StatefulWidget {
  const AddHabbitPage({super.key});

  @override
  State<AddHabbitPage> createState() => _AddHabbitPageState();
}

class _AddHabbitPageState extends State<AddHabbitPage> {
  final habitNameController = TextEditingController();
  final habitDescController = TextEditingController();
  int? dropdownValueIcon = 1;
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
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sameGap(height),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.21,
                      ),
                      Text(
                        'Add Habbit',
                        style: GoogleFonts.roboto(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Palette.purpleColor),
                      ),
                    ],
                  ),
                  sameGap(height * 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        AddGoalContainer(
                            height: height,
                            title: 'Habit Title',
                            hintText: 'Enter the title of your habit',
                            controller: habitNameController,
                            maxLines: 1),
                        sameGap(height),
                        AddGoalContainer(
                            height: height,
                            title: 'Habit Description',
                            hintText: 'Enter your description',
                            controller: habitDescController,
                            maxLines: 4),
                        sameGap(height),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: width * 0.04),
                                ChooseHabitIcon(
                                    dropdownValueIcon: dropdownValueIcon,
                                    chosed1: ((value) {
                                      setState(() {
                                        dropdownValueIcon = value;
                                      });
                                    })),
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: SecondaryColors.pruple,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 4),
                                    child: Text(
                                      "Change Logo",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          color: PrimaryColors.pruple,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        TextButton(
                          onPressed: () {
                            if (habitNameController.text.isNotEmpty) {
                              Navigator.pop(context);
                              OnlineStorage().createHabbit(
                                  title: habitNameController.text,
                                  desc: habitDescController.text,
                                  icon: dropdownValueIcon!);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: height * 0.06,
                            decoration: BoxDecoration(
                              color: Palette.purpleColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Done",
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
