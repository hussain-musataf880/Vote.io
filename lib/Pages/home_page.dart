import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              print('Hello');
              Navigator.pushNamed(context, '/scanner');
            },
            child: Icon(
              Icons.person,
              color: Colors.black54,
              size: 28,
            ),
          )
        ],
        title: Text(
          'Vote.io',
          style: TextStyle(
              fontSize: 30,
              color: Color.fromRGBO(75, 105, 255, 1),
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
