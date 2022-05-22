import 'package:csa_usage_history/screens/home/components/input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String pcNum = "1";
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadPcNum();
  }

  _loadPcNum() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      pcNum = (_prefs.getString('pc_num') ?? "1");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();

    return Stack(
      children: [
        Center(
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Input(
                      defaultValue: pcNum,
                      placeholder: "PC Number",
                      validator: (val) {
                        if (val == "") {
                          return "plz write pc number";
                        }
                      },
                      onSaved: (val) {
                        setState(
                          () {
                            if (val != null) {
                              setState(
                                () {
                                  pcNum = val;
                                },
                              );
                            }
                          },
                        );
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
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString("pc_num", pcNum);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: const Center(
                            child: Text(
                              "Save",
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
                ))),
        Positioned(
          top: 50,
          left: 50,
          child: IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        )
      ],
    );
  }
}
