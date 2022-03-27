import 'package:csa_usage_history/screens/using/components/my_text.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  @override
  void dispose() async {
    super.dispose();
    await stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    stopWatchTimer.onExecute.add(StopWatchExecute.start);

    return StreamBuilder<int>(
      stream: stopWatchTimer.rawTime,
      initialData: stopWatchTimer.rawTime.value,
      builder: (context, snap) {
        final value = snap.data!;
        final displayTime = StopWatchTimer.getDisplayTime(value, hours: true);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyText(word: displayTime),
            const MyText(word: "has passed since"),
            MyText(word: widget.name + " have started")
          ],
        );
      },
    );
  }
}
