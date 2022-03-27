import 'package:csa_usage_history/screens/using/body.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';

class UsingScreen extends StatefulWidget {
  const UsingScreen({
    Key? key,
    required this.name,
    required this.supervisor,
    required this.purpose,
    required this.startTime,
  }) : super(key: key);

  final String name, supervisor, purpose, startTime;

  @override
  State<UsingScreen> createState() => _UsingScreenState();
}

class _UsingScreenState extends State<UsingScreen> with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    _init();
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  void _init() async {
    await windowManager.setPreventClose(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(name: widget.name),
    );
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Are you sure?'),
            elevation: 20,
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
            contentTextStyle:
                const TextStyle(color: Colors.white, fontSize: 15),
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
                  final res =
                      await Supabase.instance.client.from("history").insert([
                    {
                      "name": widget.name,
                      "pc_number": 5,
                      "supervisor": widget.supervisor,
                      "purpose": widget.purpose,
                      "start_time": widget.startTime,
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
        },
      );
    }
  }
}
