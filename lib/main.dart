import 'package:flutter/material.dart';
import 'package:ielts_voca_app/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding_page.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isOnboarded = prefs.getBool("isOnboarded") ?? false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isOnboarded ? HomePage() : OnboardingPage(),
    );
  }
}
