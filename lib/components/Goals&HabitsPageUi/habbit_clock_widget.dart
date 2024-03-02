import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/services/data/habit_provider.dart';
import 'package:to_do_list_app/utils/palette.dart';

class HabbitClockWidget extends StatefulWidget {
  const HabbitClockWidget({
    super.key,
  });

  @override
  State<HabbitClockWidget> createState() => _HabbitClockWidgetState();
}

class _HabbitClockWidgetState extends State<HabbitClockWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    DateTime? _dateTime;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.28,
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          TimePickerSpinner(
            is24HourMode: false,
            normalTextStyle: const TextStyle(
                fontSize: 24, color: Color.fromARGB(255, 164, 164, 164)),
            highlightedTextStyle:
                const TextStyle(fontSize: 24, color: Colors.black),
            spacing: 50,
            itemHeight: 80,
            isForce2Digits: true,
            onTimeChange: (time) {
              setState(() {
                _dateTime = time;
                String finalTime = DateFormat('HH:mm').format(_dateTime!);
                context.read<HabitsProvider>().getTime(finalTime);
                finalTime = '';
              });
            },
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Palette.purpleColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 4),
                    child: Text(
                      'Done',
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  context.read<HabitsProvider>().cancelTime();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 181, 181, 181),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 4),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
