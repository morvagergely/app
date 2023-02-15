import 'dart:collection';

import 'package:app/word_set/bloc/word.bloc.dart';
import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'word.state.freezed.dart';

/// State type for [WordBloc].
@freezed
class WordState with _$WordState {
  /// Defines a state, containing [values].
  const factory WordState.value({
    required LinkedHashMap<String, WordChipController> values,
  }) = WordStateValue;
}
