import 'desconto.dart';

class Periodo {
  final String? tempoFormatado;
  final String? tempo;
  final double? valor;
  final double? valorTotal;
  final bool? temCortesia;
  final Desconto? desconto;

  Periodo({
    this.tempoFormatado,
    this.tempo,
    this.valor,
    this.valorTotal,
    this.temCortesia,
    this.desconto,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      tempoFormatado: json['tempoFormatado'],
      tempo: json['tempo'],
      valor: json['valor']?.toDouble(),
      valorTotal: json['valorTotal']?.toDouble(),
      temCortesia: json['temCortesia'],
      desconto:
          json['desconto'] != null ? Desconto.fromJson(json['desconto']) : null,
    );
  }
}
