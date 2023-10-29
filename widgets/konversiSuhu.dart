import 'package:flutter/material.dart';

class KonversiSuhu extends StatelessWidget {
  const KonversiSuhu({
    super.key,  
    required this.onPressed,
  });

  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: 1000,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 0, 110, 253), // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          onPressed();
        },
        child: Text('Konversi suhu'),
      ),
    );
  }
}