import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class HomePageHeadder extends StatefulWidget {
  const HomePageHeadder({
    super.key,
  });

  @override
  State<HomePageHeadder> createState() => _HomePageHeadderState();
}

class _HomePageHeadderState extends State<HomePageHeadder> {
  late String name = '';
  @override
  void initState() {
    final _myBox = Hive.box('todo');
    name = _myBox.get('name') ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color.fromRGBO(33, 16, 95, 1.0),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset('assets/images/logo1.png'),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello!",
              style: GoogleFonts.lato(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 113, 112, 112),
                  fontWeight: FontWeight.w500),
            ),
            Text(name, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.notifications,
          color: Colors.black,
          size: 30,
        ),
      ],
    );
  }
}
