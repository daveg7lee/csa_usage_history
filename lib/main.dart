import 'package:csa_usage_history/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://xgcvaijslydttodlmtqc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhnY3ZhaWpzbHlkdHRvZGxtdHFjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDgxMTE4NzYsImV4cCI6MTk2MzY4Nzg3Nn0.QvNFZUBPb8cELkG6sh8cd_vv_VR81dUQiIEO1Yex3J0',
  );
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
