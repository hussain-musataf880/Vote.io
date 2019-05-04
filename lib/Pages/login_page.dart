import 'package:flutter/material.dart';

import '../services/auth_services.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            headingText('hello!', 30, FontWeight.w500),
            Divider(
              color: Colors.transparent,
              height: 5,
            ),
            headingText('Welcome To Vote.IO', 15, FontWeight.w300),
            Divider(
              color: Colors.transparent,
              height: 20,
            ),
            loginForm(MediaQuery.of(context).size),
          ],
        ),
      ),
    );
  }

  Widget headingText(String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
        color: Color.fromRGBO(75, 105, 255, 1),
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  Widget loginForm(Size size) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          emailTextField(size.width),
          Divider(
            color: Colors.transparent,
            height: 10,
          ),
          passwordTextField(size.width),
          loginButton(size.width),
        ],
      ),
    );
  }

  Widget emailTextField(double width) {
    return SizedBox(
      width: width - 80,
      child: TextFormField(
        validator: (input) =>
            input.contains('@') ? null : 'Enter a valid email address',
        onSaved: (input) => _email = input,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.person),
          labelText: 'Email Address',
        ),
      ),
    );
  }

  Widget passwordTextField(double width) {
    return SizedBox(
      width: width - 80,
      child: TextFormField(
        validator: (input) => input.length > 1 ? null : 'Enter a password',
        onSaved: (input) => _password = input,
        obscureText: true,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.lock),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget loginButton(double width) {
    return Padding(
      padding: EdgeInsets.fromLTRB(width - (width * 0.45), 15, 10, 0),
      child: SizedBox(
        width: width * 0.30,
        height: width * 0.10,
        child: RaisedButton(
          textColor: Colors.white,
          color: Color.fromRGBO(75, 105, 255, 1),
          child: Text("Login"),
          onPressed: () => _authenticate(),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  void _authenticate() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthServices.instance.login(
          email: _email,
          password: _password,
          onSuccess: () {
            //DBServices.instance.getUserData();
            Navigator.pushNamed(context, '/home');
          },
          onError: (e) {
            print(e);
          });
    }
  }
}
