import 'package:flutter/material.dart';

class StatRow extends StatelessWidget {
  final String left;
  final String right;
  Color color = Colors.white;

  StatRow(this.left, this.right, {this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          left,
          style: TextStyle(color: color),
        ),
        Text(
          right,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
