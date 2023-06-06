import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iliski_kocu/screens/Onboarding/onboarding_screen.dart';
import 'package:iliski_kocu/theme/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: MyColors.primary,
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.urbanistTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: MyColors.black),
          titleTextStyle: TextStyle(color: MyColors.black),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: OnboardingScreen(),
    );
  }
}
