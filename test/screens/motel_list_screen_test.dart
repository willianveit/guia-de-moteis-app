import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_app/providers/motel_provider.dart';
import 'package:guia_de_moteis_app/screens/motel_list_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'motel_list_screen_test.mocks.dart';

@GenerateMocks([MotelProvider])
void main() {
  late MockMotelProvider mockMotelProvider;

  setUp(() {
    mockMotelProvider = MockMotelProvider();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: ChangeNotifierProvider<MotelProvider>.value(
        value: mockMotelProvider,
        child: const MotelListScreen(),
      ),
    );
  }

  testWidgets('should show loading indicator when isLoading is true',
      (WidgetTester tester) async {
    // Arrange
    when(mockMotelProvider.isLoading).thenReturn(true);
    when(mockMotelProvider.error).thenReturn(null);
    when(mockMotelProvider.motels).thenReturn([]);

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should show error message when error is not null',
      (WidgetTester tester) async {
    // Arrange
    const errorMessage = 'Error loading motels';
    when(mockMotelProvider.isLoading).thenReturn(false);
    when(mockMotelProvider.error).thenReturn(errorMessage);
    when(mockMotelProvider.motels).thenReturn([]);

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.text(errorMessage), findsOneWidget);
  });

  testWidgets('should call fetchMotels when screen initializes',
      (WidgetTester tester) async {
    // Arrange
    when(mockMotelProvider.isLoading).thenReturn(false);
    when(mockMotelProvider.error).thenReturn(null);
    when(mockMotelProvider.motels).thenReturn([]);
    when(mockMotelProvider.fetchMotels()).thenAnswer((_) => Future.value());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Assert
    verify(mockMotelProvider.fetchMotels()).called(1);
  });

  testWidgets('should show AppBar with correct title',
      (WidgetTester tester) async {
    // Arrange
    when(mockMotelProvider.isLoading).thenReturn(false);
    when(mockMotelProvider.error).thenReturn(null);
    when(mockMotelProvider.motels).thenReturn([]);

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('should show FloatingActionButton with map icon',
      (WidgetTester tester) async {
    // Arrange
    when(mockMotelProvider.isLoading).thenReturn(false);
    when(mockMotelProvider.error).thenReturn(null);
    when(mockMotelProvider.motels).thenReturn([]);

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.map), findsOneWidget);
  });
}
