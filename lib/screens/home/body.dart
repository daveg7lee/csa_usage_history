import 'package:csa_usage_history/screens/home/components/background_image.dart';
import 'package:csa_usage_history/screens/home/components/input_form.dart';
import 'package:csa_usage_history/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            BackgroundImage(),
            InputForm(),
          ],
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: IconButton(
            iconSize: 25,
            icon: const Icon(
              Icons.settings,
              color: Colors.black38,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => SettingScreen()),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
