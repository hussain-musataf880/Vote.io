import 'package:flutter/material.dart';

import '../widgets/nominee_tab.dart';

class OptionsPage extends StatefulWidget {
  List options;
  String pid;

  OptionsPage({this.options, this.pid});

  @override
  State<StatefulWidget> createState() {
    return _OptionsPageState();
  }
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    print(this.widget.options);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(75, 105, 255, 1),
        title: Text(
          'Nominees',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: this.widget.options.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: NomineeTab(
                name: this.widget.options[index]['name'],
                description: this.widget.options[index]['description'],
                image: this.widget.options[index]['image'],
                eid: this.widget.options[index]['eid'],
                pid: this.widget.pid,
                voteCount: '1201',
                isListTab: true,
              ),
            );
          },
        ),
    );
  }
}
