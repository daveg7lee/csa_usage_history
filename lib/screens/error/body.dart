import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.red),
      child: const Center(
        child: Text(
          "오류가 발생했습니다. 관리자한테 문의해주세요",
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
