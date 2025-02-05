import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_app/my_app.dart';
import 'package:guia_de_moteis_app/providers/motel_provider.dart';
import 'package:provider/provider.dart';

void main() {
  group('Main App Tests', () {
    testWidgets('App should initialize with MotelProvider',
        (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => MotelProvider(),
          child: const MyApp(),
        ),
      );

      // Verify that the MotelProvider is available in the widget tree
      expect(
        Provider.of<MotelProvider>(tester.element(find.byType(MyApp)),
            listen: false),
        isInstanceOf<MotelProvider>(),
      );

      // Verify that MyApp is present
      expect(find.byType(MyApp), findsOneWidget);
    });
  });
}
