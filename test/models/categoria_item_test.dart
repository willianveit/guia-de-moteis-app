import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_app/models/categoria_item.dart';

void main() {
  group('CategoriaItem', () {
    test('should create a CategoriaItem with null values', () {
      final categoriaItem = CategoriaItem();

      expect(categoriaItem.nome, isNull);
      expect(categoriaItem.icone, isNull);
    });

    test('should create a CategoriaItem with provided values', () {
      final categoriaItem = CategoriaItem(
        nome: 'Test Category',
        icone: 'test_icon.png',
      );

      expect(categoriaItem.nome, equals('Test Category'));
      expect(categoriaItem.icone, equals('test_icon.png'));
    });

    test('should create CategoriaItem from JSON', () {
      final json = {
        'nome': 'Test Category',
        'icone': 'test_icon.png',
      };

      final categoriaItem = CategoriaItem.fromJson(json);

      expect(categoriaItem.nome, equals('Test Category'));
      expect(categoriaItem.icone, equals('test_icon.png'));
    });

    test('should create CategoriaItem from JSON with null values', () {
      final json = {
        'nome': null,
        'icone': null,
      };

      final categoriaItem = CategoriaItem.fromJson(json);

      expect(categoriaItem.nome, isNull);
      expect(categoriaItem.icone, isNull);
    });
  });
}
