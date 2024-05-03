import 'package:flutter/material.dart';

class DetailsContent extends StatelessWidget {
  final Color color;
  final String text;

  DetailsContent({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}