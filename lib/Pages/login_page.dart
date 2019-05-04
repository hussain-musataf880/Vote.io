import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

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
          onPressed: () {},
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
