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
import 'login_screen.dart';
import 'message.dart';
import 'play_audio.dart';

class Safe extends StatefulWidget {
  static const routeName = '/home';

  @override
  _SafeState createState() => _SafeState();
}

class _SafeState extends State<Safe> with SingleTickerProviderStateMixin {
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

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    print(_center.latitude);
    print(_center.longitude);
    final coordinates = new Coordinates(_center.latitude, _center.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print(
        ' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    _currentLocation = "" +
        ' ${first.locality}, ${first.adminArea}, ${first.subAdminArea}, ${first.addressLine}';
  }

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
    getUserLocation();
    super.initState();
  }

  Items item3 = new Items(
    title: "Safety tips",
    //  img: "assets/setting.png",
  );

  Items item1 = new Items(
    title: "Learn self defence",
    //  img: "assets/setting.png",
  );

  // Items item4 = new Items(
  //   title: "Buy safety tools",
  //   //  img: "assets/setting.png",
  // );

  Items item2 = new Items(
    title: "ChatBot",

    // img: "assets/calendar.png"
  );
  Items item4 = new Items(
    title: "See Crime Rate",
    //  img: "assets/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    return _child;
  }

  Widget _myWidget() {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,

      // item8,
    ];
    var _police = "1090";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppLogo(),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Color(0XFFc2185b),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  signOut();
                },
                child: Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert),
              )),
        ],
        //brightness: Brighitemtness.li,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            childAspectRatio: 1.0,
            padding: EdgeInsets.only(left: 40, right: 40),
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LearnSelfDefence()));
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
                        Icons.fitness_center_rounded,
                        color: myColor,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        item1.title,
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
                                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Tutorial to Use Chatbot'),
                        content: Text(
                          "Currently, the chatbot supports the limited number of queries. Type “hello or hi” to initiate the conversation. And mention your problem followed by “experienced”. For example, experienced molestation.",
                          textAlign: TextAlign.left,
                          ),
                        actions: <Widget>[
                          FlatButton(
                              child: Text('Proceed'),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatBot()));
                                
                              }),
                        ],
                      );
                    });
                  
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
                        Icons.android_rounded,
                        color: myColor,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        item2.title,
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
                      MaterialPageRoute(builder: (context) => SafetyTips()));
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
                        Icons.lightbulb,
                        color: myColor,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        item3.title,
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
                      MaterialPageRoute(builder: (context) => CrimeRate()));
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
                        Icons.bar_chart_rounded,
                        color: myColor,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        item4.title,
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
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context, MaterialPageRoute(builder: (context) => Shop()));
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(10),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.grey.withOpacity(0.5),
              //           spreadRadius: 1,
              //           blurRadius: 4,
              //           offset: Offset(0, 3), // changes position of shadow
              //         ),
              //       ],
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: <Widget>[
              //         // Image.asset(
              //         //   data.img,
              //         //   width: 42,
              //         // ),
              //         Icon(
              //           Icons.shopping_cart_rounded,
              //           color: myColor,
              //           size: 80.0,
              //         ),
              //         SizedBox(
              //           height: 14,
              //         ),
              //         Text(
              //           item8.title,
              //           textAlign: TextAlign.center,
              //           style: GoogleFonts.openSans(
              //               textStyle: TextStyle(
              //                   color: headerColor,
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w600)),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ]),
      ),
    );
  }
}

class Items {
  String title;
  String img;
  Items({this.title, this.img});
}
