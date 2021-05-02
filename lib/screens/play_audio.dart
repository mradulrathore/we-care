import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../mainfunctionality/playfakecall.dart';
import 'package:sms_maintained/sms.dart';
import 'package:url_launcher/url_launcher.dart';

import 'appBar.dart';

class PlayAudio extends StatefulWidget {
  @override
  _PlayAudioState createState() => _PlayAudioState();
}

class _PlayAudioState extends State<PlayAudio> {
  Color myColor = const Color(0XFFFF748C);
  Color headerColor = const Color(0xFFF794B9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppLogo(),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Color(0XFFc2185b),
        //brightness: Brighitemtness.li,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            childAspectRatio: 1.0,
            padding: EdgeInsets.all(40.0),
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _playSiren(
                      "https://drive.google.com/file/d/12NOzQzsKXRD3vmf0GRc1aCzoX4U-7QpV/view?usp=sharing");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Image.asset(
                      //   data.img,
                      //   width: 42,
                      // ),
                      Icon(
                        Icons.notification_important_rounded,
                        color: myColor,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Play Police Siren",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: headerColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlayFakeCall()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Image.asset(
                      //   data.img,
                      //   width: 42,
                      // ),
                      Icon(
                        Icons.play_circle_fill_rounded,
                        color: myColor,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Play Recorded Audio",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: headerColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

_playSiren(link) async {
  var url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
