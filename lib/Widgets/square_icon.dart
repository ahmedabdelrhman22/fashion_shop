import 'package:flutter/material.dart';

class SquareIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double rounded;
  final Color color;

  SquareIconButton(
      {@required this.icon, this.color, this.rounded = 10, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(rounded),
        boxShadow: [
          BoxShadow(blurRadius: 0.9, color: Colors.grey),
        ],
        ),
      margin: EdgeInsets.all(15),
      width: 50,
      child: IconButton(
        icon: Icon(
          icon,
          size: 30,
          color: Colors.white,
          ),
        onPressed: onPressed,
        ),
      );
  }
}
