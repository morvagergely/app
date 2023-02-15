import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_dictionary_api/src/local_dictionary_api.dart';
import 'package:mocktail/mocktail.dart';

class MockedAssetBundle extends Mock implements AssetBundle {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('LocalDictionaryApi', () {
    late AssetBundle assetBundle;

    final mockEntries = [
      'apple',
      'crayon',
      'bird',
    ];

    setUp(() {
      assetBundle = MockedAssetBundle();
      when(() => assetBundle.loadString(any())).thenAnswer(
        (invocation) => Future.value(json.encode(mockEntries)),
      );
    });

    LocalDictionaryApi createLocalDictionaryApi() {
      return LocalDictionaryApi.withRootBundle(rootBundle: assetBundle);
    }

    group('constructors', () {
      test('works properly', () {
        expect(
          createLocalDictionaryApi,
          returnsNormally,
        );
      });

      test('works properly', () {
        expect(
          LocalDictionaryApi.new,
          returnsNormally,
        );
      });

      group('logic of the api', () {
        test('loadString gets called on initialize', () async {
          final localDictionaryApi = createLocalDictionaryApi();
          await localDictionaryApi.initialize();

          verify(
            () => assetBundle.loadString(
              any(),
            ),
          ).called(1);
        });

        test('valid value is returned', () async {
          final localDictionaryApi = createLocalDictionaryApi();
          await localDictionaryApi.initialize();

          expect(localDictionaryApi.dictionary, mockEntries);

          verify(
            () => assetBundle.loadString(
              any(),
            ),
          ).called(1);
        });
      });
    });
  });
}
