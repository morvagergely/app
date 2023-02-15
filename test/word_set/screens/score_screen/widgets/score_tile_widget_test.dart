import 'package:app/word_set/screens/score_screen/widgets/score_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildWidget({required String value}) {
    return MaterialApp(home: ScoreTile(word: value));
  }

  group('ScoreTile', () {
    testWidgets('renders ScoreTile', (tester) async {
      await tester.pumpWidget(
        buildWidget(value: 'key'),
      );

      expect(find.byType(ScoreTile), findsOneWidget);
    });

    testWidgets('finds correct text and widgets', (tester) async {
      await tester.pumpWidget(
        buildWidget(value: 'key'),
      );

      expect(find.text('key'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
    });
  });
}
