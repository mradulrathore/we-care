import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sms_maintained/sms.dart';

import 'appBar.dart';

class Message extends StatefulWidget {
  String _emergency;
  String _currentLocation;
  Message(this._emergency,this._currentLocation);
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  Color myColor = const Color(0XFFFF748C);
  Color headerColor = const Color(0xFFF794B9);
  String _police = "1090";
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
                  _sendSMS(widget._emergency, widget._currentLocation);
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
                        Icons.edit_location_rounded,
                        color: myColor,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Message Emergency Contact",
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
                  _sendSMS(widget._emergency, widget._currentLocation);
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
                        Icons.edit_location_rounded,
                        color: myColor,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Message Nearest Police Station",
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

void _sendSMS(number, location) async {
  var uri = 'I need help \n My current location is: ' + location;
  SmsSender sender = new SmsSender();
  sender.sendSms(new SmsMessage("" + number, uri));

  // if (await canLaunch(uri)) {
  //   await launch(uri);
  // } else {
  //   throw 'Could not launch $uri';
  // }
}