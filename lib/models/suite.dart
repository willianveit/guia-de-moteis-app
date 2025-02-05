import 'categoria_item.dart';
import 'item.dart';
import 'periodo.dart';

class Suite {
  final String? nome;
  final int? qtd;
  final bool? exibirQtdDisponiveis;
  final List<String>? fotos;
  final List<Item>? itens;
  final List<CategoriaItem>? categoriaItens;
  final List<Periodo>? periodos;

  Suite({
    this.nome,
    this.qtd,
    this.exibirQtdDisponiveis,
    this.fotos,
    this.itens,
    this.categoriaItens,
    this.periodos,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      nome: json['nome'],
      qtd: json['qtd'],
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'],
      fotos: (json['fotos'] as List<dynamic>?)
          ?.map((foto) => foto.toString())
          .toList(),
      itens: (json['itens'] as List<dynamic>?)
          ?.map((item) => Item.fromJson(item))
          .toList(),
      categoriaItens: (json['categoriaItens'] as List<dynamic>?)
          ?.map((categoria) => CategoriaItem.fromJson(categoria))
          .toList(),
      periodos: (json['periodos'] as List<dynamic>?)
          ?.map((periodo) => Periodo.fromJson(periodo))
          .toList(),
    );
  }
}
