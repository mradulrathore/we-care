import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

// ignore: must_be_immutable
class FakeCallScreen extends StatefulWidget {
  String fakeCallerName;

  FakeCallScreen(this.fakeCallerName);

  @override
  _FakeCallScreenState createState() =>
      _FakeCallScreenState(fakeCallerName: fakeCallerName);
}

class _FakeCallScreenState extends State<FakeCallScreen> {
  String fakeCallerName;

  _FakeCallScreenState({@required this.fakeCallerName});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterRingtonePlayer.play(
      android: AndroidSounds.ringtone,
      ios: IosSounds.glass,
      looping: true, // Android only - API >= 28
      volume: 10.0, // Android only - API >= 28
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    FlutterRingtonePlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:100.0),
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              
              heroTag: 1,
              backgroundColor: Colors.redAccent,
              
              onPressed: () {
                FlutterRingtonePlayer.stop();
                Navigator.pop(context);
              },
              child: Icon(
                
                Icons.call_end_rounded,
                
              ),
            ),
            FloatingActionButton(
              heroTag: 2,
              backgroundColor: Color.fromRGBO(0, 250, 0, 0.9),
              onPressed: () {},
              child: Icon(
                Icons.phone,
                
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/fakeCallBG.jpeg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                Icons.person,
                size: 50.0,
                color: const Color.fromRGBO(253, 200, 4, 1.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                fakeCallerName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
