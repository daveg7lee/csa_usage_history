import 'package:csa_usage_history/screens/home/components/choose_supervisor.dart';
import 'package:csa_usage_history/screens/home/components/input_form.dart';
import 'package:flutter/material.dart';

final List<String> photos = [
  "https://xgcvaijslydttodlmtqc.supabase.co/storage/v1/object/public/supervisors-photo/Emma",
  "https://xgcvaijslydttodlmtqc.supabase.co/storage/v1/object/public/supervisors-photo/David",
  "https://xgcvaijslydttodlmtqc.supabase.co/storage/v1/object/public/supervisors-photo/James",
  "https://xgcvaijslydttodlmtqc.supabase.co/storage/v1/object/public/supervisors-photo/user",
  "https://xgcvaijslydttodlmtqc.supabase.co/storage/v1/object/public/supervisors-photo/user",
  "https://xgcvaijslydttodlmtqc.supabase.co/storage/v1/object/public/supervisors-photo/user",
];

final List<String> supervisors = [
  "황은서",
  "김성민",
  "김주영",
  "조승민",
  "강지혜",
];

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChooseSupervisor(photos: photos),
        InputForm(
          supervisors: supervisors,
        )
      ],
    );
  }
}
