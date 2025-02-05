import 'suite.dart';

class Motel {
  final String? fantasia;
  final String? logo;
  final String? bairro;
  final double? distancia;
  final int? qtdFavoritos;
  final List<Suite>? suites;
  final int? qtdAvaliacoes;
  final double? media;

  Motel({
    this.fantasia,
    this.logo,
    this.bairro,
    this.distancia,
    this.qtdFavoritos,
    this.suites,
    this.qtdAvaliacoes,
    this.media,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      fantasia: json['fantasia'],
      logo: json['logo'],
      bairro: json['bairro'],
      distancia: json['distancia']?.toDouble(),
      qtdFavoritos: json['qtdFavoritos'],
      suites: (json['suites'] as List<dynamic>?)
          ?.map((suite) => Suite.fromJson(suite))
          .toList(),
      qtdAvaliacoes: json['qtdAvaliacoes'],
      media: json['media']?.toDouble(),
    );
  }
}
