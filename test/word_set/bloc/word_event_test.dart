import 'package:app/word_set/bloc/event/word.event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WordEvent', () {
    const mockValue = 'mock';

    group('WordEventAdd', () {
      test('supports value equality', () {
        expect(
          const WordEventAdd(value: mockValue),
          equals(const WordEventAdd(value: mockValue)),
        );
      });
    });
  });
}
