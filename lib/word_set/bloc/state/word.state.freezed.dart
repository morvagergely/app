// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WordState {
  LinkedHashMap<String, WordChipController> get values =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LinkedHashMap<String, WordChipController> values)
        value,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LinkedHashMap<String, WordChipController> values)? value,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LinkedHashMap<String, WordChipController> values)? value,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WordStateValue value) value,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WordStateValue value)? value,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WordStateValue value)? value,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WordStateCopyWith<WordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordStateCopyWith<$Res> {
  factory $WordStateCopyWith(WordState value, $Res Function(WordState) then) =
      _$WordStateCopyWithImpl<$Res, WordState>;
  @useResult
  $Res call({LinkedHashMap<String, WordChipController> values});
}

/// @nodoc
class _$WordStateCopyWithImpl<$Res, $Val extends WordState>
    implements $WordStateCopyWith<$Res> {
  _$WordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as LinkedHashMap<String, WordChipController>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordStateValueCopyWith<$Res>
    implements $WordStateCopyWith<$Res> {
  factory _$$WordStateValueCopyWith(
          _$WordStateValue value, $Res Function(_$WordStateValue) then) =
      __$$WordStateValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LinkedHashMap<String, WordChipController> values});
}

/// @nodoc
class __$$WordStateValueCopyWithImpl<$Res>
    extends _$WordStateCopyWithImpl<$Res, _$WordStateValue>
    implements _$$WordStateValueCopyWith<$Res> {
  __$$WordStateValueCopyWithImpl(
      _$WordStateValue _value, $Res Function(_$WordStateValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_$WordStateValue(
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as LinkedHashMap<String, WordChipController>,
    ));
  }
}

/// @nodoc

class _$WordStateValue implements WordStateValue {
  const _$WordStateValue({required this.values});

  @override
  final LinkedHashMap<String, WordChipController> values;

  @override
  String toString() {
    return 'WordState.value(values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordStateValue &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WordStateValueCopyWith<_$WordStateValue> get copyWith =>
      __$$WordStateValueCopyWithImpl<_$WordStateValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LinkedHashMap<String, WordChipController> values)
        value,
  }) {
    return value(values);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LinkedHashMap<String, WordChipController> values)? value,
  }) {
    return value?.call(values);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LinkedHashMap<String, WordChipController> values)? value,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(values);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WordStateValue value) value,
  }) {
    return value(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WordStateValue value)? value,
  }) {
    return value?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WordStateValue value)? value,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(this);
    }
    return orElse();
  }
}

abstract class WordStateValue implements WordState {
  const factory WordStateValue(
          {required final LinkedHashMap<String, WordChipController> values}) =
      _$WordStateValue;

  @override
  LinkedHashMap<String, WordChipController> get values;
  @override
  @JsonKey(ignore: true)
  _$$WordStateValueCopyWith<_$WordStateValue> get copyWith =>
      throw _privateConstructorUsedError;
}
