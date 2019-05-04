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
            onTap: () => Navigator.pushNamed(context, '/profile'),
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
      body: SafeArea(
          child: Column(


            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(

                    padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 10.0),
                    child:Stack(
                      children: <Widget> [
                        Image.asset("assets/gen_person.png", height: 180.0, width: 110.0),
                        Container(
                          padding: EdgeInsets.fromLTRB(200.0,40.0,10.0,10.0),
                          child: Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Column(

                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.fromLTRB(5,40,5,5),
                                        child:Text("Name",style: TextStyle(fontWeight: FontWeight.bold))
                                      ),
                                      SizedBox(height: 2.0,),
                                      Container(
                                        child:Text("Decription")
                                      ),
                                      SizedBox(height: 2.0,),
                                      Container(
                                          child:Text("Location")
                                      )
                                    ],

                              )
                            ],
                          )
                        ])


                        )])
                  )],
              ),

            ]
        )
      ));
  }
}


