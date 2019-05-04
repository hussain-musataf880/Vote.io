import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class BounceLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      itemBuilder: (context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index.isEven ? Colors.transparent : Color.fromRGBO(75, 105, 255, 1)),
        );
      },
    );
  }
}