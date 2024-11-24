import 'package:flutter/material.dart';
import 'package:instagram_flutter/constants/common_size.dart';
import 'package:instagram_flutter/constants/screen_size.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.width,
          color: Colors.black,
        ),
        Expanded(
            child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(common_s_gap),
            child: Container(
              decoration: ShapeDecoration(
                  shape: CircleBorder(
                      side: BorderSide(
                color: Colors.black12,
                width: 10,
              ))),
            ),
          ),
        )),
      ],
    );
  }
}
