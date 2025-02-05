import 'package:flutter/material.dart';

import '../models/motel.dart';
import 'motel_header.dart';
import 'suite_carousel.dart';

class MotelListItem extends StatelessWidget {
  final Motel motel;

  const MotelListItem({
    super.key,
    required this.motel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha((0.1 * 255).round()),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: MotelHeader(motel: motel),
        ),
        const SizedBox(height: 16),
        if (motel.suites != null)
          SuiteCarousel(
            suites: motel.suites!,
          ),
      ],
    );
  }
}
