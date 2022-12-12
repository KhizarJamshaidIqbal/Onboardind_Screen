// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding_screen/View/onboardingscreen/OnboardingScreen2.dart';
import 'package:onboarding_screen/View/screen/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? seenOnboard;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // to show status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  // to load onboard for the first time only
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: seenOnboard == true ? HomeScreen() : OnboardingScreen2());
  }
}
