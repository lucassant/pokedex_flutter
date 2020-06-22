import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  final double widthFactor;

  const StatusBar({Key key, this.widthFactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 19,
      child: Center(
        child: Container(
          height: 4,
          width: MediaQuery.of(context).size.width * 0.5,
          alignment: Alignment.centerLeft,
          decoration:
              ShapeDecoration(shape: StadiumBorder(), color: Colors.grey[300]),
          child: FractionallySizedBox(
            widthFactor: widthFactor,
            heightFactor: 1,
            child: Container(
              decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: widthFactor <= 0.5 ? Colors.red : Colors.teal),
            ),
          ),
        ),
      ),
    );
  }
}
