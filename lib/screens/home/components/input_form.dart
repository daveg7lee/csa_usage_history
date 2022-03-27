import 'package:csa_usage_history/components/input.dart';
import 'package:csa_usage_history/screens/using/using_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputForm extends StatefulWidget {
  const InputForm({Key? key, required this.supervisors}) : super(key: key);

  final List<String> supervisors;

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();

    String name = '';
    String purpose = '';
    String supervisor = '';

    return Expanded(
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: SvgPicture.asset("assets/logo.svg"),
              ),
              Input(
                placeholder: "Name",
                validator: (val) {
                  if (val == "") {
                    return "plz write your name";
                  }
                },
                onSaved: (val) {
                  setState(() {
                    if (val != null) {
                      setState(() {
                        name = val;
                      });
                    }
                  });
                },
              ),
              Input(
                placeholder: "Purpose",
                validator: (val) {
                  if (val == "") {
                    return "plz write your purpose";
                  }
                },
                onSaved: (val) {
                  setState(() {
                    if (val != null) {
                      setState(() {
                        purpose = val;
                      });
                    }
                  });
                },
              ),
              Input(
                placeholder: "Supervisor",
                validator: (val) {
                  if (val == "") {
                    return "plz write your supervisor";
                  }
                },
                onSaved: (val) {
                  setState(() {
                    if (val != null) {
                      setState(() {
                        supervisor = val;
                      });
                    }
                  });
                },
              ),
              SizedBox(
                width: size.width / 3.5,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    final now = DateTime.now();
                    final currentTime =
                        now.hour.toString() + ":" + now.minute.toString();

                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => UsingScreen(
                                name: name,
                                supervisor: supervisor,
                                purpose: purpose,
                                startTime: currentTime,
                              )),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: const Center(
                    child: Text(
                      "Start",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
