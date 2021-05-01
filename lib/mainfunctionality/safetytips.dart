import 'package:flutter/material.dart';
import 'package:shehacks_team_055/screens/appBar.dart';

class SafetyTips extends StatelessWidget {
  var list = [
    '1.	Always carry pepper spray.',
    '2.	While travelling alone make sure to provide vehicle number to your closed ones.',
    '3.	Be aware of your surroundings.',
    '4.	Threaten to take picture might scare them away',
    '5.	In case you feel you are being followed by someone take help from your family and friends.',
    '6.	Don’t feel embarrassed to shout and gain attention of surrounding whenever needed.',
    '7.	Install emergency apps which can inform your location and could provide alert to your closed ones when needed.',
    '8.	Women must have all the emergency numbers with them'
  ];

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Safety Tips';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppLogo(),
          brightness: Brightness.light,
          elevation: 0.0,
          backgroundColor: Color(0xFF5B16D0),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Container(
      child: ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 20,
          );
        },
      ),
    );
  }
}
