import 'package:flutter/material.dart';

class SupervisorPhoto extends StatelessWidget {
  const SupervisorPhoto({Key? key, required this.photo}) : super(key: key);

  final String photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            photo,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
