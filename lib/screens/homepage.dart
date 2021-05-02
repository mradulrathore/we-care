import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:latlng/latlng.dart';
import 'package:shake/shake.dart';
import 'package:shehacks_team_055/mainfunctionality/fake_call_support.dart';
import 'package:shehacks_team_055/screens/safe.dart';
import '../mainfunctionality/crime_rate.dart';

import 'package:sms_maintained/sms.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoder/geocoder.dart';

import '../mainfunctionality/chat_bot.dart';
import '../mainfunctionality/learnselfdefence.dart';
import '../mainfunctionality/listview.dart';
import '../mainfunctionality/playfakecall.dart';
import '../mainfunctionality/safetytips.dart';
import 'appBar.dart';
import 'auth.dart';
import 'call.dart';
import 'constants.dart';
import 'customWaveIndicator.dart';
import 'emergency.dart';
import 'login_screen.dart';
import 'message.dart';
import 'play_audio.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  User currentUser;
  String _currentLocation = "";
  Color myColor = const Color(0XFFFF748C);
  Color headerColor = const Color(0xFFF794B9);
  //const Color(0XFFFF748C)
  String _name, _email, _emergency, _contact;

  Widget _child;

  AuthService authService = new AuthService();

  LatLng _center;
  Position currentLocation;

  signOut() async {
    authService.signOut();
    Constants.saveUserLoggedInSharedPreference(false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Future<Null> _fetchUserInfo() async {
    Map<String, dynamic> _userInfo;
    User _currentUser = await FirebaseAuth.instance.currentUser;

    DocumentSnapshot _snapshot = await FirebaseFirestore.instance
        .collection("User Details")
        .doc(_currentUser.uid)
        .get();

    _userInfo = _snapshot.data();

    this.setState(() {
      _name = _userInfo['name'];
      _email = _userInfo['email'];
      _contact = _userInfo['mobile-number'];
      _emergency = _userInfo['Emergency-number'];
      _child = _myWidget();
      print(_name);
      print(_emergency);
    });
  }

  @override
  void initState() {
    _child = WaveIndicator();
    // _loadCurrentUser();
    _fetchUserInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _child;
  }

  Widget _myWidget() {
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
                  Navigator.push(
        context, MaterialPageRoute(builder: (context) => Emergency()));
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
                        Icons.shield,
                        color: myColor,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Emergency Mode",
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
                  Navigator.push(
        context, MaterialPageRoute(builder: (context) => Safe()));
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
                        Icons.security_rounded,
                        color: myColor,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Safe Mode",
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
