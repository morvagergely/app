import 'dart:collection';

import 'package:app/word_set/bloc/state/word.state.dart';
import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WordState', () {
    final mockOne = LinkedHashMap<String, WordChipController>.of(
      {'mock': WordChipController()},
    );

    final mockTwo = LinkedHashMap<String, WordChipController>.of(
      {'mock': WordChipController()},
    );

    group('WordStateValue', () {
      test('supports value equality', () {
        expect(
          WordStateValue(values: mockOne),
          equals(WordStateValue(values: mockOne)),
        );
        expect(mockOne, isNot(equals(mockTwo)));
      });
      test('does not equal on different inistances of controllers', () {
        expect(
          WordStateValue(values: mockOne),
          isNot(equals(WordStateValue(values: mockTwo))),
        );
      });
    });
  });
}
