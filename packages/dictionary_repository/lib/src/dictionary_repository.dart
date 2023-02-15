import 'package:dictionary_api/dictionary_api.dart';

/// A repository using a [DictionaryApi] to get words
class DictionaryRepository {
  /// Creates a [DictionaryRepository].
  const DictionaryRepository({
    required DictionaryApi dictionaryApi,
  }) : _dictionaryApi = dictionaryApi;

  final DictionaryApi _dictionaryApi;

  /// A list of words returned by the given [DictionaryApi].
  List<String> get dictionary => _dictionaryApi.dictionary;
}
