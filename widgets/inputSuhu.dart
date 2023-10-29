import 'package:flutter/material.dart';

class InputSuhu extends StatelessWidget {
  const InputSuhu({
    super.key,
    required this.suhu,
  });

  final TextEditingController suhu;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: suhu,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Input celcius"
      ),
    );
  }
}