import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/utils/palette.dart';

class ClockWidget extends StatefulWidget {
  final ValueChanged done;
  const ClockWidget({super.key, required this.done});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
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
                context.read<ToDoProvider>().getTime(finalTime);
                finalTime = '';
              });
            },
          ),
          SizedBox(height: height * 0.02),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              widget.done(4);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Palette.purpleColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
                child: Text(
                  'Done',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
