import 'dart:async';
import 'dart:collection';

import 'package:app/word_set/bloc/event/word.event.dart';
import 'package:app/word_set/bloc/state/word.state.dart';
import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.controller.dart';
import 'package:dictionary_repository/dictionary_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [Bloc] for handling states and events for WordSet.
class WordBloc extends Bloc<WordEvent, WordState> {
  /// Creates a [WordBloc] with an initial [dictionaryRepository].
  ///
  /// Initially the state contains an empty `LinkedHashMap`.
  WordBloc({required this.dictionaryRepository})
      : super(WordStateValue(values: LinkedHashMap())) {
    on<WordEventAdd>(_onTextEventAdd);
  }

  /// A dictionaryRepository, that allows getting dictionary.
  DictionaryRepository dictionaryRepository;

  FutureOr<void> _onTextEventAdd(WordEventAdd event, Emitter<WordState> emit) {
    final dictionary = dictionaryRepository.dictionary;
    if (!dictionary.contains(event.value)) {
      return null;
    }
    if (state.values.containsKey(event.value)) {
      state.values[event.value]!.animate();
    } else {
      emit(
        state.copyWith(
          values: LinkedHashMap<String, WordChipController>.of(state.values)
            ..putIfAbsent(
              event.value,
              WordChipController.new,
            ),
        ),
      );
    }
  }
}
