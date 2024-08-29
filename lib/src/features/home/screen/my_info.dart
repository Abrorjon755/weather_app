import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({
    super.key,
    required this.icon,
    required this.text,
    required this.temp,
  });

  final icon;
  final String text;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style:
          Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          temp,
          style:
          Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
