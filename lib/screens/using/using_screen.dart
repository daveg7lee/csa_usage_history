import 'package:csa_usage_history/screens/using/body.dart';
import 'package:flutter/material.dart';

class UsingScreen extends StatelessWidget {
  const UsingScreen({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(name: name),
    );
  }
}
