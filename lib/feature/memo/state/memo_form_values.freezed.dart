// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_form_values.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MemoFormValues {
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemoFormValuesCopyWith<MemoFormValues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoFormValuesCopyWith<$Res> {
  factory $MemoFormValuesCopyWith(
          MemoFormValues value, $Res Function(MemoFormValues) then) =
      _$MemoFormValuesCopyWithImpl<$Res, MemoFormValues>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$MemoFormValuesCopyWithImpl<$Res, $Val extends MemoFormValues>
    implements $MemoFormValuesCopyWith<$Res> {
  _$MemoFormValuesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoFormValuesImplCopyWith<$Res>
    implements $MemoFormValuesCopyWith<$Res> {
  factory _$$MemoFormValuesImplCopyWith(_$MemoFormValuesImpl value,
          $Res Function(_$MemoFormValuesImpl) then) =
      __$$MemoFormValuesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$MemoFormValuesImplCopyWithImpl<$Res>
    extends _$MemoFormValuesCopyWithImpl<$Res, _$MemoFormValuesImpl>
    implements _$$MemoFormValuesImplCopyWith<$Res> {
  __$$MemoFormValuesImplCopyWithImpl(
      _$MemoFormValuesImpl _value, $Res Function(_$MemoFormValuesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$MemoFormValuesImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MemoFormValuesImpl extends _MemoFormValues {
  const _$MemoFormValuesImpl({this.text = ''}) : super._();

  @override
  @JsonKey()
  final String text;

  @override
  String toString() {
    return 'MemoFormValues(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoFormValuesImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoFormValuesImplCopyWith<_$MemoFormValuesImpl> get copyWith =>
      __$$MemoFormValuesImplCopyWithImpl<_$MemoFormValuesImpl>(
          this, _$identity);
}

abstract class _MemoFormValues extends MemoFormValues {
  const factory _MemoFormValues({final String text}) = _$MemoFormValuesImpl;
  const _MemoFormValues._() : super._();

  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$MemoFormValuesImplCopyWith<_$MemoFormValuesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
