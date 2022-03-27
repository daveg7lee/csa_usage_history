import 'package:csa_usage_history/utils.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';

class ExitAlert extends StatelessWidget {
  const ExitAlert({
    Key? key,
    required this.name,
    required this.supervisor,
    required this.purpose,
  }) : super(key: key);

  final String name, supervisor, purpose;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      elevation: 20,
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      contentTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
      backgroundColor: Colors.black54,
      actions: [
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: () async {
            final now = DateTime.now();
            final date = DateTime(now.year, now.month, now.day);
            final currentTime =
                now.hour.toString() + ":" + now.minute.toString();

            Navigator.of(context).pop();
            final res = await Supabase.instance.client.from("history").insert([
              {
                "name": name,
                "pc_number": 5,
                "supervisor": supervisor,
                "purpose": purpose,
                "start_time": getCurrentTime(),
                "end_time": currentTime,
              }
            ]).execute();

            final error = res.error;
            if (error != null) {
              print(error);
              const AlertDialog(
                title: Text("Error occur try again"),
              );
            } else {
              await windowManager.destroy();
            }
          },
        ),
      ],
    );
  }
}
