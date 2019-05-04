import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  AuthServices instance = AuthServices();

  FirebaseAuth _auth = FirebaseAuth.instance;

  void login(
      String email, String password, Function onSuccess, Function onError) {
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(onSuccess())
        .catchError((error) => onError);
  }
}
