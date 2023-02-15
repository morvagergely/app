import 'package:app/word_set/bloc/word.bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'word.event.freezed.dart';

/// Event type for [WordBloc].
@freezed
class WordEvent with _$WordEvent {
  /// Defines an event of addition of [value].
  const factory WordEvent.add({required String value}) = WordEventAdd;
}
