import 'package:flutter/material.dart';
import 'package:shehacks_team_055/screens/appBar.dart';
import 'package:url_launcher/url_launcher.dart';

class LearnSelfDefence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppLogo(),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Color(0xFF5B16D0),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: List.generate(1, (int i) {
        return Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                print("object");
                _openVideo("youtu.be/T7aNSRoDCmg");
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/youtube0.jpeg"),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                print("object");
                _openVideo("youtu.be/9m-x64bKfR4");
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/youtube1.jpeg"),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                print("object");
                _openVideo("youtu.be/9OdzSFyL0_0");
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/youtube2.jpeg"),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                print("object");
                _openVideo("youtu.be/EmKOOZIropE");
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/youtube3.jpeg"),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                print("object");
                _openVideo("youtu.be/Ww1DeUSC94o");
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/youtube4.jpeg"),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                print("object");
                _openVideo("youtu.be/1y5SD7UDiw4");
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/youtube5.jpeg"),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        );
      }),
    );
  }

  _openVideo(link) async {
    var url = 'https://' + link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
