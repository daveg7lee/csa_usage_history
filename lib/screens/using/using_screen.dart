import 'package:csa_usage_history/screens/using/body.dart';
import 'package:csa_usage_history/screens/using/components/exit_alert.dart';
import 'package:flutter/material.dart';
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
      body: Body(
        name: widget.name,
        purpose: widget.purpose,
        supervisor: widget.supervisor,
        startTime: widget.startTime,
      ),
    );
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return ExitAlert(
            name: widget.name,
            purpose: widget.purpose,
            supervisor: widget.supervisor,
            startTime: widget.startTime,
          );
        },
      );
    }
  }
}
