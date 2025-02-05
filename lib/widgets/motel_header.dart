import 'package:flutter/material.dart';

import '../models/motel.dart';

class MotelHeader extends StatelessWidget {
  final Motel motel;

  const MotelHeader({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopRow(context),
        const SizedBox(height: 16),
        _buildRatingRow(),
        const SizedBox(height: 12),
        _buildPriceTag(context),
      ],
    );
  }

  Widget _buildTopRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          _buildLogo(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  motel.fantasia ?? '',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                _buildLocationRow(context),
              ],
            ),
          ),
          _buildFavoriteButton(context),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(motel.logo ?? ''),
          fit: BoxFit.cover,
          onError: (exception, stackTrace) {},
        ),
      ),
    );
  }

  Widget _buildLocationRow(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          size: 16,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(width: 4),
        Text(
          motel.bairro ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildFavoriteButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite_border,
        size: 28,
        color: Theme.of(context).colorScheme.secondary,
      ),
      onPressed: () {
        // TODO: Implement favorite functionality
      },
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                size: 16,
                color: Colors.amber,
              ),
              const SizedBox(width: 4),
              Text(
                '${motel.media?.toStringAsFixed(1) ?? '0.0'} (${motel.qtdAvaliacoes ?? 0})',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceTag(BuildContext context) {
    final startingPrice = motel.suites?.first.periodos?.first.valor;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'A partir de R\$ ${startingPrice?.toStringAsFixed(2) ?? '0,00'}',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
