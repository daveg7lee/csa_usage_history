import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({Key? key, required this.word}) : super(key: key);

  final String word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        word,
        style: const TextStyle(
            color: Colors.white, fontSize: 65, fontWeight: FontWeight.bold),
      ),
    );
  }
}
