import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:to_do_list_app/services/data/goal_provider.dart';

class SelectStartDayWidget extends StatefulWidget {
  const SelectStartDayWidget({
    super.key,
  });

  @override
  State<SelectStartDayWidget> createState() => _SelectStartDayWidgetState();
}

class _SelectStartDayWidgetState extends State<SelectStartDayWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime? _selectedDay;
    DateTime? _focusedDay = DateTime.now();
    CalendarFormat _calendarFormat = CalendarFormat.month;
    return Card(
        margin: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: MediaQuery.of(context).size.height * 0.20),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: Column(
              children: [
                Text(
                  'Choose Your Start Day',
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 20),
                TableCalendar(
                  firstDay: DateTime.utc(2024, 2, 14),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      String finalDay =
                          DateFormat('dd MM yyyy').format(_selectedDay!);
                      context.read<GoalsProvider>().getStartDay(finalDay);
                      finalDay = '';
                    });
                    Navigator.pop(context);
                  },
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
