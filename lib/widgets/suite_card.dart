import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/suite.dart';

class SuiteCard extends StatelessWidget {
  final Suite suite;
  final bool isLast;

  const SuiteCard({
    super.key,
    required this.suite,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildCard(context),
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSuiteImage(),
          const SizedBox(height: 20),
          _buildCardContent(context),
        ],
      ),
    );
  }

  Widget _buildSuiteImage() {
    if (!(suite.fotos?.isNotEmpty ?? false)) return const SizedBox.shrink();

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: CachedNetworkImage(
        imageUrl: suite.fotos?.first ?? '',
        fit: BoxFit.cover,
        width: double.infinity,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _buildCardContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              suite.nome ?? 'Suite',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildCategoriasList(),
        const SizedBox(height: 12),
        _buildItensList(),
        const SizedBox(height: 12),
        _buildPeriodosList(context),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildCategoriasList() {
    if (!(suite.categoriaItens?.isNotEmpty ?? false)) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: suite.categoriaItens!.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final categoria = suite.categoriaItens![index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 12 : 0,
              right: index == suite.categoriaItens!.length - 1 ? 12 : 0,
            ),
            child: Chip(
              avatar: categoria.icone != null
                  ? Image.network(categoria.icone!)
                  : null,
              label: Text(categoria.nome ?? ''),
            ),
          );
        },
      ),
    );
  }

  Widget _buildItensList() {
    if (!(suite.itens?.isNotEmpty ?? false)) return const SizedBox.shrink();

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: suite.itens!.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final item = suite.itens![index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 12 : 0,
              right: index == suite.itens!.length - 1 ? 12 : 0,
            ),
            child: Chip(
              label: Text(item.nome ?? ''),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPeriodosList(BuildContext context) {
    if (!(suite.periodos?.isNotEmpty ?? false)) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: suite.periodos!
            .map((periodo) => _buildPeriodoItem(context, periodo))
            .toList(),
      ),
    );
  }

  Widget _buildPeriodoItem(BuildContext context, dynamic periodo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              periodo.tempoFormatado ?? periodo.tempo ?? '',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              if (periodo.temCortesia == true)
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Chip(label: Text('Cortesia')),
                ),
              Text(
                'R\$ ${periodo.valor?.toStringAsFixed(2) ?? '0,00'}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              if (periodo.desconto != null)
                _buildDescontoChip(context, periodo),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescontoChip(BuildContext context, dynamic periodo) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Chip(
        label: Text('-${periodo.desconto?.desconto?.toStringAsFixed(0) ?? 0}%'),
        backgroundColor:
            Theme.of(context).colorScheme.error.withAlpha((0.1 * 255).round()),
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
