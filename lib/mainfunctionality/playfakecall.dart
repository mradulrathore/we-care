import 'package:flutter/material.dart';
import 'package:shehacks_team_055/screens/appBar.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayFakeCall extends StatelessWidget {
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
            Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[50],
            ),
            InkWell(
              onTap: () {
                print("object");
                _openVideo(
                    "https://drive.google.com/file/d/1IFxxNd4NaiYM70F2VW_4eYnQZzwTwMGm/view?usp=sharing");
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/song.PNG"),
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[50],
            ),
            InkWell(
              onTap: () {
                print("object");
                _openVideo(
                    "https://drive.google.com/file/d/1-nJgIcC4TLTmgbt0MeUTz3v3Jexv72Fs/view?usp=sharing");
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/song.PNG"),
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[50],
            ),
            InkWell(
              onTap: () {
                print("object");
                _openVideo(
                    "https://drive.google.com/file/d/1M6jNa9gnqAlIt_C9Zo-8O9PDLRXTISy2/view?usp=sharing");
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/song.PNG"),
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[50],
            ),
            InkWell(
              onTap: () {
                print("object");
                _openVideo(
                    "https://drive.google.com/file/d/1lIphlw4GU_13dO3OZ5NiS9QawxDNPyef/view?usp=sharing");
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/song.PNG"),
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[50],
            ),
            InkWell(
              onTap: () {
                print("object");
                _openVideo(
                    "https://drive.google.com/file/d/1bOyDVpI5lQrqOeq6Jj5PWBfGRag7SD4C/view?usp=sharing");
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/song.PNG"),
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[50],
            ),
            InkWell(
              onTap: () {
                print("object");
                _openVideo(
                    "https://drive.google.com/file/d/19uBr-5XON82kabNGI1CcAq5u7eWVLa_O/view?usp=sharing");
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/song.PNG"),
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[50],
            ),
          ],
        );
      }),
    );
  }

  _openVideo(link) async {
    var url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
