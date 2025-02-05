class CategoriaItem {
  final String? nome;
  final String? icone;

  CategoriaItem({this.nome, this.icone});

  factory CategoriaItem.fromJson(Map<String, dynamic> json) {
    return CategoriaItem(
      nome: json['nome'],
      icone: json['icone'],
    );
  }
}
