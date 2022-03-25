import 'package:csa_usage_history/screens/home/components/choose_supervisor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final List<String> photos = [
  "https://xgcvaijslydttodlmtqc.supabase.co/storage/v1/object/public/supervisors-photo/Emma",
  "https://xgcvaijslydttodlmtqc.supabase.co/storage/v1/object/public/supervisors-photo/David",
  "https://xgcvaijslydttodlmtqc.supabase.co/storage/v1/object/public/supervisors-photo/James",
  "https://xgcvaijslydttodlmtqc.supabase.co/storage/v1/object/public/supervisors-photo/user",
  "https://xgcvaijslydttodlmtqc.supabase.co/storage/v1/object/public/supervisors-photo/user",
  "https://xgcvaijslydttodlmtqc.supabase.co/storage/v1/object/public/supervisors-photo/user",
];

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: size.width / 2,
          height: size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/logo.svg"),
              ],
            ),
          ),
        ),
        ChooseSupervisor(photos: photos),
      ],
    );
  }
}
