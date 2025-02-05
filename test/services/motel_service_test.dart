import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_app/models/motel.dart';
import 'package:guia_de_moteis_app/models/suite.dart';
import 'package:guia_de_moteis_app/services/motel_service.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mocks/motel_response_mock.dart';
import 'motel_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MotelService motelService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    motelService = MotelService(client: mockClient);
  });

  group('MotelService', () {
    test('should return a list of motels when the request is successful',
        () async {
      // Arrange
      const mockResponse = motelResponseMock;
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(mockResponse, 200));

      // Act
      final result = await motelService.getMotels();

      // Assert
      expect(result, isA<List<Motel>>());
      expect(result.first.fantasia, equals('F'));
      expect(result.first.suites, isA<List<Suite>>());
      expect(result.first.suites?.first.nome,
          equals('Suíte Marselha s/ garagem privativa'));
    });

    test('should throw an exception when the response is not 200', () async {
      // Arrange
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Error', 404));

      // Act & Assert
      expect(motelService.getMotels(), throwsA(isA<Exception>()));
    });

    test('should throw an exception when JSON format is invalid', () async {
      // Arrange
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Invalid JSON', 200));

      // Act & Assert
      expect(motelService.getMotels(), throwsA(isA<Exception>()));
    });

    test('should handle network timeout appropriately', () async {
      // Arrange
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async {
        await Future.delayed(const Duration(seconds: 1));
        throw http.ClientException('Connection timeout');
      });

      // Act & Assert
      expect(motelService.getMotels(), throwsA(isA<Exception>()));
    });

    test('should handle server error (500) appropriately', () async {
      // Arrange
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Server Error', 500));

      // Act & Assert
      expect(motelService.getMotels(), throwsA(isA<Exception>()));
    });
  });
}
