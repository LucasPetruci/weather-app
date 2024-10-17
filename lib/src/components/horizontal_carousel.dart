import 'package:flutter/material.dart';
import 'package:weather_app/src/components/box_details.dart';
import 'package:weather_app/src/components/scroll_behavior_mofied.dart';

class HorizontalCarousel extends StatelessWidget {
  final String precipitation, wind, cloudCover;
  const HorizontalCarousel(
      {super.key,
      required this.precipitation,
      required this.wind,
      required this.cloudCover});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ScrollConfiguration(
        behavior: ScrollBehaviorModified(),
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          children: [
            MyBoxDetails(
              path: 'assets/box/precipitation.png',
              content: precipitation,
              text: "Preciptação",
            ),
            MyBoxDetails(
              path: 'assets/box/wind.png',
              content: wind,
              text: "Vento",
            ),
            MyBoxDetails(
              path: 'assets/box/nuvem.png',
              content: cloudCover,
              text: "Cobertura de nuvem",
            ),
          ],
        ),
      ),
    );
  }
}
