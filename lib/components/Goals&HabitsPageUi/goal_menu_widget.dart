import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/components/SubComponents/select_time_widget.dart';

class GoalMenuWidget extends StatefulWidget {
  const GoalMenuWidget({
    super.key,
    required this.width,
    required this.chosed,
    required this.dropdownValueString,
  });

  final double width;
  final ValueChanged chosed;

  final String? dropdownValueString;

  @override
  State<GoalMenuWidget> createState() => _GoalMenuWidgetState();
}

class _GoalMenuWidgetState extends State<GoalMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        const SelectTimeWidget(),
        SizedBox(
          width: widget.width * 0.02,
        ),
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
        SizedBox(
          width: widget.width * 0.02,
        ),
      ],
    );
  }
}
