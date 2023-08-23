// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lectura.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Lectura _$LecturaFromJson(Map<String, dynamic> json) {
  return _Lectura.fromJson(json);
}

/// @nodoc
mixin _$Lectura {
  @JsonKey(includeToJson: false)
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @DatetimeJsonConverter()
  DateTime get fecha => throw _privateConstructorUsedError;
  int get isOk => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LecturaCopyWith<Lectura> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LecturaCopyWith<$Res> {
  factory $LecturaCopyWith(Lectura value, $Res Function(Lectura) then) =
      _$LecturaCopyWithImpl<$Res, Lectura>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int id,
      String code,
      @DatetimeJsonConverter() DateTime fecha,
      int isOk});
}

/// @nodoc
class _$LecturaCopyWithImpl<$Res, $Val extends Lectura>
    implements $LecturaCopyWith<$Res> {
  _$LecturaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? fecha = null,
    Object? isOk = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      fecha: null == fecha
          ? _value.fecha
          : fecha // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isOk: null == isOk
          ? _value.isOk
          : isOk // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LecturaCopyWith<$Res> implements $LecturaCopyWith<$Res> {
  factory _$$_LecturaCopyWith(
          _$_Lectura value, $Res Function(_$_Lectura) then) =
      __$$_LecturaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int id,
      String code,
      @DatetimeJsonConverter() DateTime fecha,
      int isOk});
}

/// @nodoc
class __$$_LecturaCopyWithImpl<$Res>
    extends _$LecturaCopyWithImpl<$Res, _$_Lectura>
    implements _$$_LecturaCopyWith<$Res> {
  __$$_LecturaCopyWithImpl(_$_Lectura _value, $Res Function(_$_Lectura) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? fecha = null,
    Object? isOk = null,
  }) {
    return _then(_$_Lectura(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      fecha: null == fecha
          ? _value.fecha
          : fecha // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isOk: null == isOk
          ? _value.isOk
          : isOk // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Lectura implements _Lectura {
  const _$_Lectura(
      {@JsonKey(includeToJson: false) required this.id,
      required this.code,
      @DatetimeJsonConverter() required this.fecha,
      required this.isOk});

  factory _$_Lectura.fromJson(Map<String, dynamic> json) =>
      _$$_LecturaFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final int id;
  @override
  final String code;
  @override
  @DatetimeJsonConverter()
  final DateTime fecha;
  @override
  final int isOk;

  @override
  String toString() {
    return 'Lectura(id: $id, code: $code, fecha: $fecha, isOk: $isOk)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Lectura &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fecha, fecha) || other.fecha == fecha) &&
            (identical(other.isOk, isOk) || other.isOk == isOk));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, fecha, isOk);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LecturaCopyWith<_$_Lectura> get copyWith =>
      __$$_LecturaCopyWithImpl<_$_Lectura>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LecturaToJson(
      this,
    );
  }
}

abstract class _Lectura implements Lectura {
  const factory _Lectura(
      {@JsonKey(includeToJson: false) required final int id,
      required final String code,
      @DatetimeJsonConverter() required final DateTime fecha,
      required final int isOk}) = _$_Lectura;

  factory _Lectura.fromJson(Map<String, dynamic> json) = _$_Lectura.fromJson;

  @override
  @JsonKey(includeToJson: false)
  int get id;
  @override
  String get code;
  @override
  @DatetimeJsonConverter()
  DateTime get fecha;
  @override
  int get isOk;
  @override
  @JsonKey(ignore: true)
  _$$_LecturaCopyWith<_$_Lectura> get copyWith =>
      throw _privateConstructorUsedError;
}
