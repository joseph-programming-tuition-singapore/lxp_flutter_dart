import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lxp_flutter_dart/view_models/testing_view_model.dart';
import 'package:lxp_flutter_dart/views/testing_view.dart';

void main() {
  testWidgets('Test the button widget', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MaterialApp(
      home: TestingView(
        viewModel: TestingViewModel(),
      ),
    ));

    // Find a widget that displays the count text that is set to 0 initially
    expect(find.text('0'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byKey(const Key('add_count_button')));
    await tester.pump();

    // Find a widget that displays the count text that is set to 0 initially
    expect(find.text('1'), findsOneWidget);
  });
}
