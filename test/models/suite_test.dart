import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_app/models/suite.dart';

void main() {
  group('Suite', () {
    test('should create Suite instance with null values', () {
      final suite = Suite();

      expect(suite.nome, isNull);
      expect(suite.qtd, isNull);
      expect(suite.exibirQtdDisponiveis, isNull);
      expect(suite.fotos, isNull);
      expect(suite.itens, isNull);
      expect(suite.categoriaItens, isNull);
      expect(suite.periodos, isNull);
    });

    test('should create Suite instance with provided values', () {
      final suite = Suite(
        nome: 'Suite Luxo',
        qtd: 5,
        exibirQtdDisponiveis: true,
        fotos: ['foto1.jpg', 'foto2.jpg'],
        itens: [],
        categoriaItens: [],
        periodos: [],
      );

      expect(suite.nome, equals('Suite Luxo'));
      expect(suite.qtd, equals(5));
      expect(suite.exibirQtdDisponiveis, isTrue);
      expect(suite.fotos, equals(['foto1.jpg', 'foto2.jpg']));
      expect(suite.itens, isEmpty);
      expect(suite.categoriaItens, isEmpty);
      expect(suite.periodos, isEmpty);
    });

    group('fromJson', () {
      test('should create Suite instance from JSON with all fields', () {
        final json = {
          'nome': 'Suite Master',
          'qtd': 3,
          'exibirQtdDisponiveis': true,
          'fotos': ['foto1.jpg', 'foto2.jpg'],
          'itens': [
            {'nome': 'TV', 'descricao': '42 polegadas'}
          ],
          'categoriaItens': [
            {'nome': 'Eletrônicos', 'descricao': 'Itens eletrônicos'}
          ],
          'periodos': [
            {'inicio': '2024-03-20', 'fim': '2024-03-25'}
          ],
        };

        final suite = Suite.fromJson(json);

        expect(suite.nome, equals('Suite Master'));
        expect(suite.qtd, equals(3));
        expect(suite.exibirQtdDisponiveis, isTrue);
        expect(suite.fotos, equals(['foto1.jpg', 'foto2.jpg']));
        expect(suite.itens?.length, equals(1));
        expect(suite.itens?.first.nome, equals('TV'));
        expect(suite.categoriaItens?.length, equals(1));
        expect(suite.categoriaItens?.first.nome, equals('Eletrônicos'));
        expect(suite.periodos?.length, equals(1));
      });

      test('should handle null values in JSON', () {
        final json = {
          'nome': null,
          'qtd': null,
          'exibirQtdDisponiveis': null,
          'fotos': null,
          'itens': null,
          'categoriaItens': null,
          'periodos': null,
        };

        final suite = Suite.fromJson(json);

        expect(suite.nome, isNull);
        expect(suite.qtd, isNull);
        expect(suite.exibirQtdDisponiveis, isNull);
        expect(suite.fotos, isNull);
        expect(suite.itens, isNull);
        expect(suite.categoriaItens, isNull);
        expect(suite.periodos, isNull);
      });

      test('should handle empty lists in JSON', () {
        final json = {
          'nome': 'Suite Basic',
          'fotos': [],
          'itens': [],
          'categoriaItens': [],
          'periodos': [],
        };

        final suite = Suite.fromJson(json);

        expect(suite.nome, equals('Suite Basic'));
        expect(suite.fotos, isEmpty);
        expect(suite.itens, isEmpty);
        expect(suite.categoriaItens, isEmpty);
        expect(suite.periodos, isEmpty);
      });
    });
  });
}
