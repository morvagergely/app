import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.controller.dart';
import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildWidget({required String value}) {
    return MaterialApp(
      home: Material(
        child: WordChip(value: value, controller: WordChipController()),
      ),
    );
  }

  group('WordChip', () {
    testWidgets('renders WordChip', (tester) async {
      await tester.pumpWidget(
        buildWidget(value: 'key'),
      );

      expect(find.byType(WordChip), findsOneWidget);
    });

    testWidgets('finds correct text and widgets', (tester) async {
      await tester.pumpWidget(
        buildWidget(value: 'key'),
      );

      expect(find.byType(Chip), findsOneWidget);
      expect(find.text('key'), findsOneWidget);
    });
  });
}
