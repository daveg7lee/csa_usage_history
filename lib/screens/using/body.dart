import 'package:csa_usage_history/screens/using/components/texts.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Center(
        child: Texts(name: name),
      ),
    );
  }
}
