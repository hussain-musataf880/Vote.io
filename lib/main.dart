import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() => runApp(VoteIO());

class VoteIO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new HomePage(),
        '/login': (BuildContext context) => new LoginPage(),
        '/profile': (BuildContext context) => new LoginPage(),
      },
    );
  }
}
