import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final Icon icon;
  final String text;
  ContentCard(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        icon,
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(color: Color(0xFF8D8E98), fontSize: 18),
        ),
      ],
    );
  }
}
