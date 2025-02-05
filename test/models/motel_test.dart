import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_app/models/motel.dart';
import 'package:guia_de_moteis_app/models/suite.dart';

void main() {
  group('Motel', () {
    test('should create Motel instance with all properties', () {
      final motel = Motel(
        fantasia: 'Test Motel',
        logo: 'logo.png',
        bairro: 'Downtown',
        distancia: 2.5,
        qtdFavoritos: 10,
        suites: [
          Suite(nome: 'Suite 1'),
          Suite(nome: 'Suite 2'),
        ],
        qtdAvaliacoes: 20,
        media: 4.5,
      );

      expect(motel.fantasia, equals('Test Motel'));
      expect(motel.logo, equals('logo.png'));
      expect(motel.bairro, equals('Downtown'));
      expect(motel.distancia, equals(2.5));
      expect(motel.qtdFavoritos, equals(10));
      expect(motel.suites?.length, equals(2));
      expect(motel.qtdAvaliacoes, equals(20));
      expect(motel.media, equals(4.5));
    });

    test('should create Motel instance from JSON', () {
      final json = {
        'fantasia': 'Test Motel',
        'logo': 'logo.png',
        'bairro': 'Downtown',
        'distancia': 2.5,
        'qtdFavoritos': 10,
        'suites': [
          {'nome': 'Suite 1'},
          {'nome': 'Suite 2'},
        ],
        'qtdAvaliacoes': 20,
        'media': 4.5,
      };

      final motel = Motel.fromJson(json);

      expect(motel.fantasia, equals('Test Motel'));
      expect(motel.logo, equals('logo.png'));
      expect(motel.bairro, equals('Downtown'));
      expect(motel.distancia, equals(2.5));
      expect(motel.qtdFavoritos, equals(10));
      expect(motel.suites?.length, equals(2));
      expect(motel.suites?[0].nome, equals('Suite 1'));
      expect(motel.suites?[1].nome, equals('Suite 2'));
      expect(motel.qtdAvaliacoes, equals(20));
      expect(motel.media, equals(4.5));
    });

    test('should handle null values in JSON', () {
      final json = {
        'fantasia': null,
        'logo': null,
        'bairro': null,
        'distancia': null,
        'qtdFavoritos': null,
        'suites': null,
        'qtdAvaliacoes': null,
        'media': null,
      };

      final motel = Motel.fromJson(json);

      expect(motel.fantasia, isNull);
      expect(motel.logo, isNull);
      expect(motel.bairro, isNull);
      expect(motel.distancia, isNull);
      expect(motel.qtdFavoritos, isNull);
      expect(motel.suites, isNull);
      expect(motel.qtdAvaliacoes, isNull);
      expect(motel.media, isNull);
    });
  });
}
