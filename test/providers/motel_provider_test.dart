import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_app/models/motel.dart';
import 'package:guia_de_moteis_app/providers/motel_provider.dart';
import 'package:guia_de_moteis_app/services/motel_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mocks/motel_response_mock.dart';
import 'motel_provider_test.mocks.dart';

// Generate mock class
@GenerateNiceMocks([MockSpec<MotelService>()])
void main() {
  late MotelProvider motelProvider;
  late MockMotelService mockMotelService;

  setUp(() {
    mockMotelService = MockMotelService();
    motelProvider = MotelProvider();
  });

  group('MotelProvider', () {
    test('initial values are correct', () {
      expect(motelProvider.motels, isEmpty);
      expect(motelProvider.isLoading, false);
      expect(motelProvider.error, null);
    });

    test('fetchMotels success scenario', () async {
      // Arrange
      when(mockMotelService.getMotels()).thenAnswer((_) async => mockMotels);

      // Act
      await motelProvider.fetchMotels();

      // Assert
      expect(motelProvider.motels.length, equals(mockMotels.length));
      expect(motelProvider.motels.first, isA<Motel>());
      expect(motelProvider.isLoading, false);
      expect(motelProvider.error, null);
    });

    test('fetchMotels sets loading state correctly', () async {
      // Arrange
      when(mockMotelService.getMotels()).thenAnswer((_) async {
        // Verify loading state is true during the operation
        expect(motelProvider.isLoading, true);
        return [];
      });

      // Act
      await motelProvider.fetchMotels();

      // Assert
      expect(motelProvider.isLoading, false);
    });
  });
}
