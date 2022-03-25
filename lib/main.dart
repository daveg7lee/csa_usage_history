import 'package:csa_usage_history/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Usage Recorder',
      home: HomeScreen(),
    );
  }
}
