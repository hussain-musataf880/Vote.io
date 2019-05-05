import 'package:flutter/material.dart';

import '../pages/scanner_page.dart';

class NomineeTab extends StatelessWidget {
  final String name;
  final String description;
  final String voteCount;
  final String image;
  final String eid;
  final String pid;
  final bool isListTab;

  NomineeTab(
      {this.name,
      this.description,
      this.voteCount,
      this.image,
      this.eid,
      this.isListTab,
      this.pid});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          profileImage(image),
          infoTab(name, description, voteCount),
          isListTab ? voteButton(context) : Container(),
        ],
      ),
    );
  }

  Widget profileImage(String image) {
    return Positioned(
      left: 5,
      top: -30,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }

  Widget voteButton(context) {
    return Positioned(
      right: 20,
      child: FloatingActionButton(
        heroTag: this.eid,
        backgroundColor: Color.fromRGBO(75, 105, 255, 1),
        child: Icon(Icons.fingerprint),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScannerPage(
                    name: name,
                    image: image,
                    description: description,
                    eid: eid,
                    pid: pid,
                  ),
            ),
          );
        },
      ),
    );
  }

  Widget infoTab(String name, String detail, String voteCount) {
    return Positioned(
      left: 110,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              detail,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            Divider(
              height: 10,
            ),
            Text(
              'Votes: ' + voteCount,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Colors.black54),
            ),
          ]),
    );
  }
}
