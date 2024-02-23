import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/components/add_goal_container.dart';

import 'package:to_do_list_app/utils/palette.dart';
import 'package:to_do_list_app/utils/utils.dart';

class AddHabbitPage extends StatefulWidget {
  const AddHabbitPage({super.key});

  @override
  State<AddHabbitPage> createState() => _AddHabbitPageState();
}

class _AddHabbitPageState extends State<AddHabbitPage> {
  final goalNameController = TextEditingController();
  final goalDescController = TextEditingController();
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
                            title: 'Hait title',
                            hintText: 'Enter the title of your habit',
                            controller: goalNameController,
                            maxLines: 1),
                        sameGap(height),
                        AddGoalContainer(
                            height: height,
                            title: 'Habit description',
                            hintText: 'Enter your description',
                            controller: goalDescController,
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
                                containerIcon(
                                    50, 50, FontAwesomeIcons.suitcase, 30),
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
                            Navigator.pop(context);
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
