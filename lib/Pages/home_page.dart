import "package:flutter/material.dart";
import 'package:voteio/services/db_services.dart';
import 'package:voteio/widgets/loading_indicators.dart';
import 'dart:async';

import '../services/geo_location_services.dart';
import '../services/auth_services.dart';

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
  Map userLocation;
  bool hasLocation = false;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pages = DBServices.instance.getPolls();
    getUserLoction();
    Timer.periodic(Duration(seconds: 3), (Timer t) => getUserLoction());
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
      body: StreamBuilder(
          stream: pages,
          initialData: [],
          builder: (context, AsyncSnapshot snap) {
            List pageList = snap.data.toList();
            if (hasLocation) {
              pageList = filterPollResults(0.025, pageList);
            }
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
  }

  void getUserLoction() async {
    userLocation = await GeoLocationServices.instance.getLocation();
    setState(() {
      hasLocation = true;
    });
  }

  List filterPollResults(double radius, List pollList) {
    List filterList = [];
    for (var poll in pollList) {
      var userDistance = GeoLocationServices.instance.getDistance(
          userLocation['latitude'],
          userLocation['longitude'],
          poll['pollLocation'].latitude,
          poll['pollLocation'].longitude);
      if (userDistance < radius &&
          !poll['voters'].contains(AuthServices.instance.user.uid)) {
        filterList.add(poll);
      }
    }
    return filterList;
  }
}
