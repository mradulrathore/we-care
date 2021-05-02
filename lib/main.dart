import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/authentication.dart';



import 'screens/homepage.dart';

import 'screens/login_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/tmp.dart';


//import 'package:app_onboarding/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth appAuth = FirebaseAuth.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Authentication(),
          )
        ],
        child: MaterialApp(
          title: 'We Care',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "GoogleSans",
            primarySwatch: Colors.amberAccent[600],
          ),
          home: OnboardingScreen(),
          routes: {
            LoginScreen.routeName: (ctx) => LoginScreen(),
            HomePage.routeName: (ctx) => HomePage(),
            OnboardingScreen.routeName: (ctx) => OnboardingScreen(),
          },
        ));
  }
}
