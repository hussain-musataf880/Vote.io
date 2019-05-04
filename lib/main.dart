import 'package:flutter/material.dart';

import 'Pages/login_page.dart';

void main() => runApp(VoteIO());

class VoteIO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
