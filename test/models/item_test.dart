import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_app/models/item.dart';

void main() {
  group('Item', () {
    test('should create Item with nome', () {
      final item = Item(nome: 'Test Item');
      expect(item.nome, equals('Test Item'));
    });

    test('should create Item with null nome', () {
      final item = Item();
      expect(item.nome, isNull);
    });

    group('fromJson', () {
      test('should create Item from JSON with nome', () {
        final json = {'nome': 'Test Item'};
        final item = Item.fromJson(json);
        expect(item.nome, equals('Test Item'));
      });

      test('should create Item from JSON with null nome', () {
        final json = {'nome': null};
        final item = Item.fromJson(json);
        expect(item.nome, isNull);
      });

      test('should create Item from JSON with missing nome', () {
        final json = <String, dynamic>{};
        final item = Item.fromJson(json);
        expect(item.nome, isNull);
      });
    });
  });
}
