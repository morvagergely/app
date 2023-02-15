import 'package:dictionary_api/src/dictionary_api.dart';
import 'package:flutter_test/flutter_test.dart';

class TestDictionaryApi extends DictionaryApi {
  TestDictionaryApi() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('TodosApi', () {
    test('can be constructed', () {
      expect(TestDictionaryApi.new, returnsNormally);
    });
  });
}
