import 'package:flutter/material.dart';

class PollCard extends StatelessWidget {
  final Map _data;
  final bool _active;
  Function _ontap;

  double blur;
  double offset;
  double top;

  PollCard(this._data, this._active, this._ontap) {
    blur = _active ? 30 : 0;
    offset = _active ? 20 : 0;
    top = _active ? 50 : 150;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _ontap(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(_data['image']),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black87,
                  blurRadius: blur,
                  offset: Offset(offset, offset))
            ]),
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Padding(
                  child: Text(
                    _data['title'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24,
                        decoration: TextDecoration.none),
                  ),
                  padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
