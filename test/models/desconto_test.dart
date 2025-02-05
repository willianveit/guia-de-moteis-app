import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_app/models/desconto.dart'; // Update with your actual package name

void main() {
  group('Desconto', () {
    test('should create a Desconto instance with null desconto', () {
      final desconto = Desconto();
      expect(desconto.desconto, isNull);
    });

    test('should create a Desconto instance with a desconto value', () {
      final desconto = Desconto(desconto: 10.5);
      expect(desconto.desconto, equals(10.5));
    });

    group('fromJson', () {
      test('should create a Desconto instance from JSON with desconto value',
          () {
        final json = {'desconto': 15.5};
        final desconto = Desconto.fromJson(json);
        expect(desconto.desconto, equals(15.5));
      });

      test('should create a Desconto instance from JSON with null desconto',
          () {
        final json = {'desconto': null};
        final desconto = Desconto.fromJson(json);
        expect(desconto.desconto, isNull);
      });

      test('should handle missing desconto key in JSON', () {
        final json = <String, dynamic>{};
        final desconto = Desconto.fromJson(json);
        expect(desconto.desconto, isNull);
      });
    });
  });
}
