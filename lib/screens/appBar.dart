import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 22),
        children: <TextSpan>[
          TextSpan(
              text: 'Help',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black87)),
          TextSpan(
              text: 'Youself',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        ],
      ),
    );
  }
}
