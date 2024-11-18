import 'package:flutter/material.dart';

class orDivider extends StatelessWidget {
  const orDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          right: 0,
          height: 1,
          child: Container(
            color: Colors.grey[300],
            height: 1,
          ),
        ),
        Container(
          color: Colors.grey[50],
          height: 3,
          width: 60,
        ),
        Text('OR',
            style:
            TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold))
      ],
    );
  }
}