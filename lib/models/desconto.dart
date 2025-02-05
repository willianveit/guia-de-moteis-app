class Desconto {
  final double? desconto;

  Desconto({this.desconto});

  factory Desconto.fromJson(Map<String, dynamic> json) {
    return Desconto(
      desconto: json['desconto']?.toDouble(),
    );
  }
}
