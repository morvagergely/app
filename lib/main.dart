import 'package:app/word_set/bloc/word.bloc.dart';
import 'package:app/word_set/screens/input_screen/input.screen.dart';
import 'package:dictionary_repository/dictionary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_dictionary_api/local_dictionary_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dictionaryApi = LocalDictionaryApi();
  await dictionaryApi.initialize();
  runApp(MyApp(dictionaryApi: dictionaryApi));
}

/// A wrapper widget for the [MaterialApp].
///
/// The [MaterialApp] is provided a [WordBloc] instance,
/// which uses [dictionaryApi].
class MyApp extends StatelessWidget {
  /// Creates a wrapper widget for the [MaterialApp].
  const MyApp({required this.dictionaryApi, super.key});

  /// What api to use for the dictionary.
  final LocalDictionaryApi dictionaryApi;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WordBloc(
        dictionaryRepository: DictionaryRepository(
          dictionaryApi: dictionaryApi,
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
        ),
        home: const InputScreen(),
      ),
    );
  }
}
