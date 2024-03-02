import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/services/data/habit_provider.dart';
import 'package:to_do_list_app/utils/palette.dart';

class SelectDaysOfTheHabbitTask extends StatefulWidget {
  const SelectDaysOfTheHabbitTask({
    Key? key,
    required this.day,
  }) : super(key: key);

  final String day;

  @override
  _SelectDaysOfTheHabbitTaskState createState() =>
      _SelectDaysOfTheHabbitTaskState();
}

class _SelectDaysOfTheHabbitTaskState extends State<SelectDaysOfTheHabbitTask> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 40,
          child: Row(
            children: [
              const SizedBox(width: 20),
              Text(
                widget.day,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                    context
                        .read<HabitsProvider>()
                        .removeDay(widget.day, isSelected);
                  });
                },
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        isSelected ? Palette.purpleColor : Colors.transparent,
                    border: Border.all(color: Colors.black),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
