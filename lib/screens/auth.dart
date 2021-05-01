import 'package:firebase_auth/firebase_auth.dart';
import 'package:shehacks_team_055/screens/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  OurUser _userFromFirebaseUser(User user) {
    return user != null ? OurUser(uid: user.uid) : null;
  }

  Future signInEmailAndPass(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
