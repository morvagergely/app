import 'dart:collection';

import 'package:app/word_set/bloc/event/word.event.dart';
import 'package:app/word_set/bloc/state/word.state.dart';
import 'package:app/word_set/bloc/word.bloc.dart';
import 'package:app/word_set/screens/input_screen/input.screen.dart';
import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.controller.dart';
import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.widget.dart';
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
        home: InputScreen(),
      ),
    );
  }

  group('InputScreen', () {
    setUp(() {
      when(() => mockWordBloc.state).thenReturn(
        WordStateValue(
          values: LinkedHashMap.of({'key': WordChipController()}),
        ),
      );
    });

    testWidgets('renders InputScreen', (tester) async {
      await tester.pumpWidget(
        buildScreen(),
      );

      expect(find.byType(InputScreen), findsOneWidget);
    });

    testWidgets('finds correct WordChip on InputScreen', (tester) async {
      await tester.pumpWidget(
        buildScreen(),
      );

      expect(find.byType(WordChip), findsOneWidget);
      expect(find.text('key'), findsOneWidget);
    });

    testWidgets('textfield gets cleared on add', (tester) async {
      await tester.pumpWidget(
        buildScreen(),
      );

      await tester.enterText(find.byType(TextField), 'bird');

      expect(find.text('bird'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));

      expect(find.text('bird'), findsNothing);
    });
  });
}
