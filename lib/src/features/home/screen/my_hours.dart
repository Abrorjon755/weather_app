import 'package:flutter/material.dart';

class MyHours extends StatelessWidget {
  const MyHours({
    super.key,
    required this.date,
    required this.image,
    required this.temp,
  });

  final String date;
  final String image;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          date,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 12),
        Image(
          width: 40,
          image: AssetImage(image),
        ),
        const SizedBox(height: 12),
        Text(
          temp,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}
