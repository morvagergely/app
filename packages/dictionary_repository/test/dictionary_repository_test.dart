import 'package:dictionary_api/dictionary_api.dart';
import 'package:dictionary_repository/src/dictionary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDictionaryApi extends Mock implements DictionaryApi {}

void main() {
  group('TodosRepository', () {
    late DictionaryApi api;

    final mockEntries = [
      'apple',
      'crayon',
      'bird',
    ];

    setUp(() {
      api = MockDictionaryApi();
      when(() => api.dictionary).thenAnswer((_) => mockEntries);
    });

    DictionaryRepository createDictionaryRepository() => DictionaryRepository(
          dictionaryApi: api,
        );

    group('constructor', () {
      test('works properly', () {
        expect(
          createDictionaryRepository,
          returnsNormally,
        );
      });
    });

    group('getTodos', () {
      test('makes correct api request', () {
        final dictionaryRepository = createDictionaryRepository();

        expect(
          dictionaryRepository.dictionary,
          isNot(throwsA(anything)),
        );

        verify(() => api.dictionary).called(1);
      });

      test('returns correct dictionary values', () {
        expect(
          createDictionaryRepository().dictionary,
          mockEntries,
        );
      });
    });
  });
}
