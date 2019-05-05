import "package:flutter/material.dart";
import 'package:voteio/services/db_services.dart';
import 'package:voteio/widgets/loading_indicators.dart';

import '../pages/options_page.dart';

import '../widgets/poll_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController(viewportFraction: 0.8);

  Stream pages;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pages = DBServices.instance.getPolls();

    controller.addListener(() {
      int nextPage = controller.page.round();

      if (nextPage != currentPage) {
        setState(() {
          currentPage = nextPage;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(75, 105, 255, 1),
        title: Text(
          'Vote.io',
          style: TextStyle(color: Colors.white),
        ),
      ),
<<<<<<< HEAD
      body: StreamBuilder(
          stream: pages,
          initialData: [],
          builder: (context, AsyncSnapshot snap) {
            List pageList = snap.data.toList();
            return (pageList.length != 0)
                ? PageView.builder(
                    controller: controller,
                    itemCount: pageList.length,
                    itemBuilder: (context, int currentIndex) {
                      bool isPageActive = currentPage == currentIndex;
                      return PollCard(pageList[currentIndex], isPageActive, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OptionsPage(
                                  options: pageList[currentIndex]['options'],
                                  pid: pageList[currentIndex]['id'],
                                ),
                          ),
                        );
                      });
                    },
                  )
                : BounceLoadingIndicator();
          }),
    );
=======
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
                  ),
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
                  ),
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
                  ),
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
                  ),
                ],
              ),

            ]
        )
      ));
>>>>>>> 6900b080468f763250d80419a4cb6f5af8383a32
  }
}


