import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lxp_flutter_dart/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the count button, verify count', (
      tester,
    ) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      // navigate to test page
      final listTile = find.byKey(const ValueKey('testing_list_tile'));

      // Emulate a tap on the list tile.
      await tester.tap(listTile);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the button to tap on.
      final button = find.byKey(const ValueKey('add_count_button'));

      // Emulate a tap on the floating action button.
      await tester.tap(button);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);
    });
  });
}
