import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/components/Goals&HabitsPageUi/habbit_clock_widget.dart';
import 'package:to_do_list_app/components/SubComponents/select_days_of_the_habbit_task.dart';

import 'package:to_do_list_app/services/data/habit_provider.dart';
import 'package:to_do_list_app/utils/palette.dart';

class AddHabbitMenuWidget extends StatefulWidget {
  const AddHabbitMenuWidget({
    super.key,
    required this.width,
    required this.chosed,
    required this.dropdownValueString,
  });

  final double width;
  final ValueChanged chosed;

  final String? dropdownValueString;

  @override
  State<AddHabbitMenuWidget> createState() => _AddHabbitMenuWidgetState();
}

class _AddHabbitMenuWidgetState extends State<AddHabbitMenuWidget> {
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width * 0.02,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.15,
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              'Choose The Days Of The Task',
                              style: TextStyle(
                                  color: Palette.purpleColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ListView.builder(
                              itemCount: days.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final day = days[index];
                                return SelectDaysOfTheHabbitTask(day: day);
                              }),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Palette.purpleColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 14.0, vertical: 8),
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Every Day',
                  style: GoogleFonts.roboto(
                    color: Palette.purpleColorscondary,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const HabbitClockWidget();
                  });
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      (context.watch<HabitsProvider>().time == '??:??')
                          ? 'Time'
                          : context.watch<HabitsProvider>().time,
                      style: GoogleFonts.roboto(
                          color: Palette.purpleColorscondary,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      FontAwesomeIcons.solidClock,
                      color: Palette.purpleColorscondary,
                      size: 18,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: DropdownButton<String>(
              elevation: 0,
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              value: widget.dropdownValueString,
              iconSize: 20,
              items: const [
                DropdownMenuItem(
                  value: 'Priority 4',
                  child: Row(
                    children: [
                      Icon(
                        Icons.flag,
                        color: Colors.green,
                      ),
                      Text(
                        'Priority 4',
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Priority 3',
                  child: Row(
                    children: [
                      Icon(Icons.flag, color: Color.fromARGB(255, 225, 255, 2)),
                      Text(
                        'Priority 3',
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Priority 2',
                  child: Row(
                    children: [
                      Icon(Icons.flag, color: Color.fromARGB(255, 248, 126, 4)),
                      Text(
                        'Priority 2',
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Priority 1',
                  child: Row(
                    children: [
                      Icon(Icons.flag, color: Colors.red),
                      Text(
                        'Priority 1',
                      ),
                    ],
                  ),
                ),
              ],
              onChanged: (String? newValue) {
                widget.chosed(newValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}
