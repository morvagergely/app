import 'dart:collection';

import 'package:app/word_set/bloc/event/word.event.dart';
import 'package:app/word_set/bloc/state/word.state.dart';
import 'package:app/word_set/bloc/word.bloc.dart';
import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.controller.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dictionary_repository/dictionary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDictionaryRepository extends Mock implements DictionaryRepository {}

void main() {
  final mockEntries = [
    'apple',
    'crayon',
    'bird',
  ];

  final controller = WordChipController();

  group('WordBloc', () {
    late DictionaryRepository dictionaryRepository;

    setUp(() {
      dictionaryRepository = MockDictionaryRepository();
      when(
        () => dictionaryRepository.dictionary,
      ).thenAnswer((_) => mockEntries);
    });

    WordBloc buildBloc() {
      return WordBloc(dictionaryRepository: dictionaryRepository);
    }

    group('constructor', () {
      test('works properly', () => expect(buildBloc, returnsNormally));

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(WordStateValue(values: LinkedHashMap())),
        );
      });
    });

    group('WordEventAdd', () {
      blocTest<WordBloc, WordState>(
        'adds a valid word',
        build: buildBloc,
        seed: () => WordStateValue(values: LinkedHashMap()),
        act: (bloc) => bloc.add(WordEventAdd(value: mockEntries.first)),
        verify: (_) {
          verify(
            () => dictionaryRepository.dictionary,
          ).called(1);
        },
        expect: () => [
          const TypeMatcher<WordStateValue>().having(
            (state) => state.values[mockEntries.first],
            'has a valid entry with `WordChipController`',
            const TypeMatcher<WordChipController>(),
          ),
        ],
      );

      blocTest<WordBloc, WordState>(
        'adds a valid word, that already exists in the state',
        build: buildBloc,
        seed: () => WordStateValue(
          values: LinkedHashMap.of({mockEntries.first: controller}),
        ),
        act: (bloc) => bloc.add(WordEventAdd(value: mockEntries.first)),
        verify: (_) {
          verify(
            () => dictionaryRepository.dictionary,
          ).called(1);
        },
        expect: () => <Matcher>[],
      );

      test('controller stream should emit when already existing word is given',
          () async {
        final wordBloc = WordBloc(dictionaryRepository: dictionaryRepository)
          ..add(WordEventAdd(value: mockEntries.first));

        await expectLater(
          wordBloc.stream,
          emits(
            const TypeMatcher<WordStateValue>().having(
              (state) => state.values[mockEntries.first],
              'has a valid entry with `WordChipController`',
              const TypeMatcher<WordChipController>(),
            ),
          ),
        );

        final value = wordBloc.state.values[mockEntries.first];

        wordBloc.add(WordEventAdd(value: mockEntries.first));

        await expectLater(value!.stream, emits(null));
      });

      blocTest<WordBloc, WordState>(
        'adds an invalid word (no state is emitted)',
        build: buildBloc,
        seed: () => WordStateValue(values: LinkedHashMap()),
        act: (bloc) => bloc.add(const WordEventAdd(value: 'qwe')),
        verify: (_) {
          verify(
            () => dictionaryRepository.dictionary,
          ).called(1);
        },
        expect: () => <WordState>[],
      );
    });
  });
}
