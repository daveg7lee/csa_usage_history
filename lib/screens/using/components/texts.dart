import 'package:csa_usage_history/screens/complete/complete_screen.dart';
import 'package:csa_usage_history/screens/error/error_screen.dart';
import 'package:csa_usage_history/screens/home/home_screen.dart';
import 'package:csa_usage_history/screens/using/components/my_text.dart';
import 'package:csa_usage_history/utils.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Texts extends StatefulWidget {
  const Texts(
      {Key? key,
      required this.name,
      required this.supervisor,
      required this.purpose,
      required this.startTime})
      : super(key: key);

  final String name, supervisor, purpose, startTime;

  @override
  State<Texts> createState() => _TextsState();
}

class _TextsState extends State<Texts> {
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
        final displayTime =
            StopWatchTimer.getDisplayTime(value, milliSecond: false);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyText(word: displayTime),
            const MyText(word: "has passed since"),
            MyText(word: widget.name + " have started"),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text("정말 종료하시겠습니까?"),
                            content: const Text("종료하시려면 Yes를 눌러주세요"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('No'),
                              ),
                              TextButton(
                                  onPressed: () {
                                    final res = insertData(
                                      widget.name,
                                      widget.supervisor,
                                      widget.purpose,
                                      widget.startTime,
                                    );
                                    res.then(
                                      (res) async => {
                                        if (res.error != null)
                                          {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: ((context) =>
                                                    ErrorScreen()),
                                              ),
                                            )
                                          }
                                        else
                                          {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: ((context) =>
                                                    CompleteScreen()),
                                              ),
                                            )
                                          }
                                      },
                                    );
                                  },
                                  child: const Text("Yes"))
                            ],
                          ));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Done"),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
