import 'package:flutter/material.dart';
import 'package:to_do_list_app/components/text_field.dart';
import 'package:to_do_list_app/pages/page_controller.dart';
import 'package:to_do_list_app/services/firebaseStroage/tasks_service.dart';
import 'package:to_do_list_app/utils/palette.dart';

class NamePopUp extends StatefulWidget {
  const NamePopUp({
    super.key,
  });

  @override
  State<NamePopUp> createState() => _NamePopUpState();
}

class _NamePopUpState extends State<NamePopUp> {
  late TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    @override
    void initState() {
      super.initState();
      nameController = TextEditingController();
    }

    @override
    void dispose() {
      nameController.dispose();
      super.dispose();
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              height: height * 0.3,
              width: width * 0.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter Your Name',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextFieldE(
                      hinttext: 'Tarek Labidi',
                      isObscure: false,
                      changeObscure: (value) {},
                      isPassword: false,
                      controller: nameController,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                      decoration: BoxDecoration(
                          color: Palette.purpleColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          onPressed: () {
                            if (nameController.text.isNotEmpty) {
                              OnlineStorage()
                                  .createName(name: nameController.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PagesController()));
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 3),
                            child: Text(
                              "Enter",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
