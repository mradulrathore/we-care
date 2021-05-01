import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'customDialogs.dart';
import 'homepage.dart';
//

class RegisterPage extends StatefulWidget {
  
  static const routeName = '/register';
  
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String _phoneNumber;
  String _address;
  String _name;
  String _emergency;

  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(_user) async {
    if (isLoggedIn()) {
      FirebaseFirestore.instance
          .collection('User Details')
          .doc(_user['uid'])
          .set(_user)
          .catchError((e) {
        print(e);
      });
    } else {
      print('You need to be logged In');
    }
  }

  bool validate_save() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validate_submit(BuildContext context) async {
    if (validate_save()) {
      try {
        CustomDialogs.progressDialog(
            context: context, message: 'Registration under process');
        User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _email, password: _password))
            .user;
        Navigator.pop(context);
        print('Registered User: ${user.uid}');
        final Map<String, dynamic> UserDetails = {
          'uid': user.uid,
          'name': _name,
          'email': _email,
          'mobile-number': _phoneNumber,
          'address': _address,
          'Emergency-number': _emergency,
        };
        addData(UserDetails).then((result) {
          print("User Added");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }).catchError((e) {
          print(e);
        });
      } catch (e) {
        print('Errr : $e');
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text('Registration Failed'),
                content: Text('Error : $e'),
                actions: <Widget>[
                  FlatButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      })
                ],
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      systemNavigationBarColor: Color(0xFF5B16D0), //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Color.fromARGB(1000, 221, 46, 68),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color(0xFF5B16D0),
        title: Text(
          "Register",
        ),
      ),
      body: Container(
        height: 800.0,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF5B16D0)),
                          ),
                          icon: Icon(
                            FontAwesomeIcons.user,
                            color: Color(0xFF5B16D0),
                          ),
                        ),
                        validator: (value) =>
                            value.isEmpty ? "Name field can't be empty" : null,
                        onSaved: (value) => _name = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email ID',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF5B16D0)),
                          ),
                          icon: Icon(
                            FontAwesomeIcons.envelope,
                            color: Color(0xFF5B16D0),
                          ),
                        ),
                        validator: (value) => value.isEmpty
                            ? "Email ID field can't be empty"
                            : null,
                        onSaved: (value) => _email = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF5B16D0)),
                          ),
                          icon: Icon(
                            FontAwesomeIcons.userLock,
                            color: Color(0xFF5B16D0),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) => value.isEmpty
                            ? "Password field can't be empty"
                            : null,
                        onSaved: (value) => _password = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Address',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF5B16D0)),
                          ),
                          icon: Icon(       
                            FontAwesomeIcons.addressBook,
                            color: Color(0xFF5B16D0),
                          ),
                        ),
                        validator: (value) => value.isEmpty
                            ? "Address field can't be empty"
                            : null,
                        onSaved: (value) => _address = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Phone No.',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF5B16D0)),
                          ),
                          icon: Icon(
                            FontAwesomeIcons.phone,
                            color: Color(0xFF5B16D0),
                          ),
                        ),
                        validator: (value) =>
                            value.isEmpty || value.length != 10
                                ? "Enter correct phone number"
                                : null,
                        onSaved: (value) => _phoneNumber = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Emergency Contact.',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF5B16D0)),
                          ),
                          icon: Icon(
                            FontAwesomeIcons.phone,
                            color: Color(0xFF5B16D0),
                          ),
                        ),
                        validator: (value) =>
                            value.isEmpty || value.length != 10
                                ? "enter correct phone number"
                                : null,
                        onSaved: (value) => _emergency = value,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => validate_submit(context),
                      textColor: Colors.white,
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      color: Color(0xFF5B16D0),
                      child: Text("REGISTER"),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
