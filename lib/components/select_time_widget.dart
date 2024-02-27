import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_list_app/components/clock_widget.dart';
import 'package:to_do_list_app/services/data/provider.dart';
import 'package:to_do_list_app/utils/palette.dart';

class SelectTimeWidget extends StatefulWidget {
  const SelectTimeWidget({
    super.key,
  });

  @override
  State<SelectTimeWidget> createState() => _SelectTimeWidgetState();
}

class _SelectTimeWidgetState extends State<SelectTimeWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime? _selectedDay;
    DateTime? _focusedDay = DateTime.now();
    CalendarFormat _calendarFormat = CalendarFormat.month;
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: MediaQuery.of(context).size.height * 0.22),
                child: Card(
                    margin: const EdgeInsets.only(bottom: 10)
                        .copyWith(left: 10, right: 10, top: 10),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: TableCalendar(
                          firstDay: DateTime.now(),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: _focusedDay!,
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                              String finalDay = DateFormat('dd MM yyyy')
                                  .format(_selectedDay!);
                              context.read<ToDoProvider>().getDay(finalDay);
                              finalDay = '';
                            });
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return ClockWidget(
                                    done: (value) {
                                      Navigator.pop(context);
                                    },
                                  );
                                });
                          },
                          calendarFormat: _calendarFormat,
                          onFormatChanged: (format) {
                            setState(() {
                              print("ddd");
                              _calendarFormat = format;
                            });
                          },
                        ),
                      ),
                    )),
              );
            });
      },
      child: Chip(
          label: (context.watch<ToDoProvider>().day.length < 4)
              ? const Row(
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
                          color: Color.fromARGB(255, 163, 137, 255),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              : Text(
                  context.watch<ToDoProvider>().day.substring(0, 5),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 163, 137, 255),
                      fontWeight: FontWeight.bold),
                )),
    );
  }
}
