import 'dart:async';

/// An abstraction of an api to get a [dictionary].
abstract class DictionaryApi {
  /// Creates a [DictionaryApi].
  const DictionaryApi();

  /// A list of words
  List<String> get dictionary;

  /// Initializes the dictionary
  Future<void> initialize();
}
