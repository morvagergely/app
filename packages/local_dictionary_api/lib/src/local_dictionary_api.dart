import 'dart:async';
import 'dart:convert';

import 'package:dictionary_api/dictionary_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// A local implementation of [DictionaryApi].
class LocalDictionaryApi extends DictionaryApi {
  /// Creates a [LocalDictionaryApi].
  LocalDictionaryApi() : _rootBundle = rootBundle;

  /// Creates a [LocalDictionaryApi] with a predefined [AssetBundle] for
  /// testing.
  @visibleForTesting
  LocalDictionaryApi.withRootBundle({required AssetBundle rootBundle})
      : _rootBundle = rootBundle;

  List<String>? _dictionary;
  final AssetBundle _rootBundle;

  @override
  List<String> get dictionary {
    assert(
      _dictionary != null,
      '`_dictionary` is null. Did you forget to call `initialize()`?',
    );
    return _dictionary!;
  }

  @override
  Future<void> initialize() async {
    final data = await _rootBundle.loadString(
      'packages/local_dictionary_api/assets/dictionary.json',
    );
    _dictionary =
        (jsonDecode(data) as List<dynamic>).map((e) => e as String).toList();
  }
}
