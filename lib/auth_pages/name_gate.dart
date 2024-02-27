import 'package:flutter/material.dart';
import 'package:to_do_list_app/components/name_pop_up.dart';
import 'package:to_do_list_app/pages/page_controller.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_service.dart';

class NameGate extends StatefulWidget {
  const NameGate({super.key});

  @override
  State<NameGate> createState() => _NameGateState();
}

class _NameGateState extends State<NameGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: OnlineStorage().isNamePresentStream(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final isNamePresent = snapshot.data!;
              if (isNamePresent) {
                return PagesController();
              } else {
                return NamePopUp();
              }
            }
          }
        }));
  }
}
