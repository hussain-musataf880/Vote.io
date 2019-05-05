import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static AuthServices instance = AuthServices();

  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser user;

  void login(
      {String email, String password, Function onSuccess, Function onError}) {
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(onSuccess())
        .catchError((error) => onError);
  }

  void getUser(Function success, Function failure) async {
    try {
      FirebaseUser _user = await _auth.currentUser();
      if (_user != null) {
        user = _user;
        success();
      }
    } catch (e) {
      failure(e);
    }
  }
}
