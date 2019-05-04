import 'package:flutter/material.dart';

class NomineeTab extends StatelessWidget {
  final String name;
  final String description;
  final String voteCount;

  NomineeTab({this.name, this.description, this.voteCount});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          image(
              'https://upload.wikimedia.org/wikipedia/commons/8/8d/President_Barack_Obama.jpg'),
          infoTab(name, description, voteCount),
        ],
      ),
    );
  }

  Widget image(String image) {
    return Positioned(
      left: 10,
      top: -60,
      height: 150,
      child: Image.network(image),
    );
  }

  Widget infoTab(String name, String detail, String voteCount) {
    return Positioned(
      right: 40,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
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
              height: 20,
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
