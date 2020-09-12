import 'package:flutter/material.dart';

class StartRating extends StatelessWidget {
  final int rating;
  final double size;

  StartRating(this.rating, {this.size = 16});

  @override
  Widget build(BuildContext context) {
    String stars = "";
    for (int i = 0; i < rating; i++) stars += "⭐ ";
    stars.trim();
    return Text(
      stars,
      style: TextStyle(fontSize: size),
      );
  }
}