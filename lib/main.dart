import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/firebase_options.dart';
import 'package:to_do_list_app/pages/page_controller.dart';
import 'package:to_do_list_app/services/auth_methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('todo');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthMethods>(
          create: (_) => AuthMethods(),
        ),
        StreamProvider(
            create: (context) => context.read<AuthMethods>().authState,
            initialData: null)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            textTheme: TextTheme(
              titleLarge: GoogleFonts.lato(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            )),
        home: const PagesController(),
      ),
    );
  }
}
