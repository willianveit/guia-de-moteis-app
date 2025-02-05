import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/suite.dart';
import 'suite_card.dart';

class SuiteCarousel extends StatelessWidget {
  final List<Suite> suites;

  const SuiteCarousel({super.key, required this.suites});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: suites.length,
      options: CarouselOptions(
        height: 560,
        viewportFraction: 0.92,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
        padEnds: false,
      ),
      itemBuilder: (context, index, realIndex) {
        return SuiteCard(
          suite: suites[index],
          isLast: index == suites.length - 1,
        );
      },
    );
  }
}
