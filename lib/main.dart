import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/home_page.dart';
import 'utils/app_color.dart';

void main() async{
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform, );
  runApp(const RavitaNexusApp());
}

class RavitaNexusApp extends StatelessWidget {
  const RavitaNexusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aerie Box',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.white,
      ),
      home: const HomePage(),
    );
  }
}
