import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.placeholder,
    required this.validator,
    required this.onSaved,
    required this.defaultValue,
  }) : super(key: key);

  final String placeholder;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final String defaultValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: size.width / 3.5,
        child: TextFormField(
          initialValue: defaultValue,
          validator: validator,
          onSaved: onSaved,
          decoration: InputDecoration(
            hintText: placeholder,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
