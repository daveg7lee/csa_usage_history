import 'package:csa_usage_history/screens/home/components/input.dart';
import 'package:csa_usage_history/screens/using/using_screen.dart';
import 'package:csa_usage_history/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

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

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Computer\nSupervising\nAssociation",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            ),
          ),
          Input(
            defaultValue: "",
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
            defaultValue: "",
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
            defaultValue: "",
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
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: size.width / 3.5,
              height: 45,
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => UsingScreen(
                              name: name,
                              supervisor: supervisor,
                              purpose: purpose,
                              startTime: getCurrentTime(),
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
          ),
        ],
      ),
    );
  }
}
