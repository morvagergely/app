import 'dart:collection';

import 'package:app/word_set/bloc/event/word.event.dart';
import 'package:app/word_set/bloc/state/word.state.dart';
import 'package:app/word_set/bloc/word.bloc.dart';
import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.controller.dart';
import 'package:app/word_set/screens/score_screen/score.screen.dart';
import 'package:app/word_set/screens/score_screen/widgets/score_tile.widget.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWordBloc extends MockBloc<WordEvent, WordState> implements WordBloc {}

void main() {
  late WordBloc mockWordBloc;

  setUp(() {
    mockWordBloc = MockWordBloc();
    when(() => mockWordBloc.state).thenReturn(
      WordStateValue(values: LinkedHashMap()),
    );
  });

  Widget buildScreen() {
    return BlocProvider.value(
      value: mockWordBloc,
      child: const MaterialApp(
        home: ScoreScreen(),
      ),
    );
  }

  group('ScoreScreen', () {
    setUp(() {
      when(() => mockWordBloc.state).thenReturn(
        WordStateValue(
          values: LinkedHashMap.of(
            {'key': WordChipController(), 'word': WordChipController()},
          ),
        ),
      );
    });

    testWidgets('renders ScoreScreen', (tester) async {
      await tester.pumpWidget(
        buildScreen(),
      );

      expect(find.byType(ScoreScreen), findsWidgets);
    });

    testWidgets('finds correct ScoreTiles on ScoreScreen', (tester) async {
      await tester.pumpWidget(
        buildScreen(),
      );

      expect(find.byType(ScoreTile), findsWidgets);
      expect(find.text('key'), findsOneWidget);
      expect(find.text('word'), findsOneWidget);
    });

    testWidgets('finds correct scores on ScoreScreen', (tester) async {
      await tester.pumpWidget(
        buildScreen(),
      );

      expect(find.byType(ScoreTile), findsWidgets);
      expect(find.text('key'), findsOneWidget);
      expect(find.text('word'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('4'), findsOneWidget);
      expect(find.text('Your score: 7'), findsOneWidget);
    });
  });
}
