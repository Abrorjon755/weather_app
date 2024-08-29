import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.4),
      highlightColor: Colors.grey.shade100.withOpacity(0.4),
      enabled: true,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: const [
          SizedBox(height: 50),
          Center(child: MyShimmer(width: 200, height: 50)),
          SizedBox(height: 10),
          Center(child: MyShimmer(width: 210, height: 25)),
          SizedBox(height: 50),
          Center(child: MyShimmer(width: 80, height: 80)),
          SizedBox(height: 20),
          Center(child: MyShimmer(width: 100, height: 40)),
          SizedBox(height: 10),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                MyShimmer(width: 80, height: 80),
                Positioned(
                  top: 5,
                  right: -25,
                  child: MyShimmer(width: 20, height: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          MyShimmer(width: double.infinity, height: 150),
          SizedBox(height: 20),
          MyShimmer(width: double.infinity, height: 500),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: MyShimmer(width: double.infinity, height: 100),
              ),
              SizedBox(width: 20),
              Expanded(
                child: MyShimmer(width: double.infinity, height: 100),
              ),
            ],
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

class MyShimmer extends StatelessWidget {
  const MyShimmer({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: width,
        height: height,
        child: const ColoredBox(color: Colors.grey),
      ),
    );
  }
}
