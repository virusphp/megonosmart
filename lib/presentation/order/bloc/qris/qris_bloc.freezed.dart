// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qris_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QrisEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String orderId, int grossAmount) generateQRCode,
    required TResult Function(String orderId) checkPaymentStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String orderId, int grossAmount)? generateQRCode,
    TResult? Function(String orderId)? checkPaymentStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String orderId, int grossAmount)? generateQRCode,
    TResult Function(String orderId)? checkPaymentStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GenerateQRCode value) generateQRCode,
    required TResult Function(_CheckPaymentStatus value) checkPaymentStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GenerateQRCode value)? generateQRCode,
    TResult? Function(_CheckPaymentStatus value)? checkPaymentStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GenerateQRCode value)? generateQRCode,
    TResult Function(_CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrisEventCopyWith<$Res> {
  factory $QrisEventCopyWith(QrisEvent value, $Res Function(QrisEvent) then) =
      _$QrisEventCopyWithImpl<$Res, QrisEvent>;
}

/// @nodoc
class _$QrisEventCopyWithImpl<$Res, $Val extends QrisEvent>
    implements $QrisEventCopyWith<$Res> {
  _$QrisEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$QrisEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl with DiagnosticableTreeMixin implements _Started {
  const _$StartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QrisEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'QrisEvent.started'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String orderId, int grossAmount) generateQRCode,
    required TResult Function(String orderId) checkPaymentStatus,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String orderId, int grossAmount)? generateQRCode,
    TResult? Function(String orderId)? checkPaymentStatus,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String orderId, int grossAmount)? generateQRCode,
    TResult Function(String orderId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GenerateQRCode value) generateQRCode,
    required TResult Function(_CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GenerateQRCode value)? generateQRCode,
    TResult? Function(_CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GenerateQRCode value)? generateQRCode,
    TResult Function(_CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements QrisEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GenerateQRCodeImplCopyWith<$Res> {
  factory _$$GenerateQRCodeImplCopyWith(_$GenerateQRCodeImpl value,
          $Res Function(_$GenerateQRCodeImpl) then) =
      __$$GenerateQRCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, int grossAmount});
}

/// @nodoc
class __$$GenerateQRCodeImplCopyWithImpl<$Res>
    extends _$QrisEventCopyWithImpl<$Res, _$GenerateQRCodeImpl>
    implements _$$GenerateQRCodeImplCopyWith<$Res> {
  __$$GenerateQRCodeImplCopyWithImpl(
      _$GenerateQRCodeImpl _value, $Res Function(_$GenerateQRCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? grossAmount = null,
  }) {
    return _then(_$GenerateQRCodeImpl(
      null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      null == grossAmount
          ? _value.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GenerateQRCodeImpl
    with DiagnosticableTreeMixin
    implements _GenerateQRCode {
  const _$GenerateQRCodeImpl(this.orderId, this.grossAmount);

  @override
  final String orderId;
  @override
  final int grossAmount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QrisEvent.generateQRCode(orderId: $orderId, grossAmount: $grossAmount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QrisEvent.generateQRCode'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('grossAmount', grossAmount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateQRCodeImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, grossAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateQRCodeImplCopyWith<_$GenerateQRCodeImpl> get copyWith =>
      __$$GenerateQRCodeImplCopyWithImpl<_$GenerateQRCodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String orderId, int grossAmount) generateQRCode,
    required TResult Function(String orderId) checkPaymentStatus,
  }) {
    return generateQRCode(orderId, grossAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String orderId, int grossAmount)? generateQRCode,
    TResult? Function(String orderId)? checkPaymentStatus,
  }) {
    return generateQRCode?.call(orderId, grossAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String orderId, int grossAmount)? generateQRCode,
    TResult Function(String orderId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (generateQRCode != null) {
      return generateQRCode(orderId, grossAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GenerateQRCode value) generateQRCode,
    required TResult Function(_CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return generateQRCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GenerateQRCode value)? generateQRCode,
    TResult? Function(_CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return generateQRCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GenerateQRCode value)? generateQRCode,
    TResult Function(_CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (generateQRCode != null) {
      return generateQRCode(this);
    }
    return orElse();
  }
}

abstract class _GenerateQRCode implements QrisEvent {
  const factory _GenerateQRCode(final String orderId, final int grossAmount) =
      _$GenerateQRCodeImpl;

  String get orderId;
  int get grossAmount;
  @JsonKey(ignore: true)
  _$$GenerateQRCodeImplCopyWith<_$GenerateQRCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckPaymentStatusImplCopyWith<$Res> {
  factory _$$CheckPaymentStatusImplCopyWith(_$CheckPaymentStatusImpl value,
          $Res Function(_$CheckPaymentStatusImpl) then) =
      __$$CheckPaymentStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$CheckPaymentStatusImplCopyWithImpl<$Res>
    extends _$QrisEventCopyWithImpl<$Res, _$CheckPaymentStatusImpl>
    implements _$$CheckPaymentStatusImplCopyWith<$Res> {
  __$$CheckPaymentStatusImplCopyWithImpl(_$CheckPaymentStatusImpl _value,
      $Res Function(_$CheckPaymentStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
  }) {
    return _then(_$CheckPaymentStatusImpl(
      null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckPaymentStatusImpl
    with DiagnosticableTreeMixin
    implements _CheckPaymentStatus {
  const _$CheckPaymentStatusImpl(this.orderId);

  @override
  final String orderId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QrisEvent.checkPaymentStatus(orderId: $orderId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QrisEvent.checkPaymentStatus'))
      ..add(DiagnosticsProperty('orderId', orderId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckPaymentStatusImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckPaymentStatusImplCopyWith<_$CheckPaymentStatusImpl> get copyWith =>
      __$$CheckPaymentStatusImplCopyWithImpl<_$CheckPaymentStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String orderId, int grossAmount) generateQRCode,
    required TResult Function(String orderId) checkPaymentStatus,
  }) {
    return checkPaymentStatus(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String orderId, int grossAmount)? generateQRCode,
    TResult? Function(String orderId)? checkPaymentStatus,
  }) {
    return checkPaymentStatus?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String orderId, int grossAmount)? generateQRCode,
    TResult Function(String orderId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (checkPaymentStatus != null) {
      return checkPaymentStatus(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GenerateQRCode value) generateQRCode,
    required TResult Function(_CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return checkPaymentStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GenerateQRCode value)? generateQRCode,
    TResult? Function(_CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return checkPaymentStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GenerateQRCode value)? generateQRCode,
    TResult Function(_CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (checkPaymentStatus != null) {
      return checkPaymentStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckPaymentStatus implements QrisEvent {
  const factory _CheckPaymentStatus(final String orderId) =
      _$CheckPaymentStatusImpl;

  String get orderId;
  @JsonKey(ignore: true)
  _$$CheckPaymentStatusImplCopyWith<_$CheckPaymentStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QrisState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(QrisResponseModel qrisResponseModel) qrisResponse,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(QrisStatusResponseModel qrisStatusRequest)
        statusCHeck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_StatusCheck value) statusCHeck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_StatusCheck value)? statusCHeck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_StatusCheck value)? statusCHeck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrisStateCopyWith<$Res> {
  factory $QrisStateCopyWith(QrisState value, $Res Function(QrisState) then) =
      _$QrisStateCopyWithImpl<$Res, QrisState>;
}

/// @nodoc
class _$QrisStateCopyWithImpl<$Res, $Val extends QrisState>
    implements $QrisStateCopyWith<$Res> {
  _$QrisStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$QrisStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QrisState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'QrisState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(QrisResponseModel qrisResponseModel) qrisResponse,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(QrisStatusResponseModel qrisStatusRequest)
        statusCHeck,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_StatusCheck value) statusCHeck,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_StatusCheck value)? statusCHeck,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_StatusCheck value)? statusCHeck,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements QrisState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$QrisStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QrisState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'QrisState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(QrisResponseModel qrisResponseModel) qrisResponse,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(QrisStatusResponseModel qrisStatusRequest)
        statusCHeck,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_StatusCheck value) statusCHeck,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_StatusCheck value)? statusCHeck,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_StatusCheck value)? statusCHeck,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements QrisState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$QrisResponseImplCopyWith<$Res> {
  factory _$$QrisResponseImplCopyWith(
          _$QrisResponseImpl value, $Res Function(_$QrisResponseImpl) then) =
      __$$QrisResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QrisResponseModel qrisResponseModel});
}

/// @nodoc
class __$$QrisResponseImplCopyWithImpl<$Res>
    extends _$QrisStateCopyWithImpl<$Res, _$QrisResponseImpl>
    implements _$$QrisResponseImplCopyWith<$Res> {
  __$$QrisResponseImplCopyWithImpl(
      _$QrisResponseImpl _value, $Res Function(_$QrisResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrisResponseModel = null,
  }) {
    return _then(_$QrisResponseImpl(
      null == qrisResponseModel
          ? _value.qrisResponseModel
          : qrisResponseModel // ignore: cast_nullable_to_non_nullable
              as QrisResponseModel,
    ));
  }
}

/// @nodoc

class _$QrisResponseImpl with DiagnosticableTreeMixin implements _QrisResponse {
  const _$QrisResponseImpl(this.qrisResponseModel);

  @override
  final QrisResponseModel qrisResponseModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QrisState.qrisResponse(qrisResponseModel: $qrisResponseModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QrisState.qrisResponse'))
      ..add(DiagnosticsProperty('qrisResponseModel', qrisResponseModel));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrisResponseImpl &&
            (identical(other.qrisResponseModel, qrisResponseModel) ||
                other.qrisResponseModel == qrisResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qrisResponseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QrisResponseImplCopyWith<_$QrisResponseImpl> get copyWith =>
      __$$QrisResponseImplCopyWithImpl<_$QrisResponseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(QrisResponseModel qrisResponseModel) qrisResponse,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(QrisStatusResponseModel qrisStatusRequest)
        statusCHeck,
  }) {
    return qrisResponse(qrisResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
  }) {
    return qrisResponse?.call(qrisResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
    required TResult orElse(),
  }) {
    if (qrisResponse != null) {
      return qrisResponse(qrisResponseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_StatusCheck value) statusCHeck,
  }) {
    return qrisResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_StatusCheck value)? statusCHeck,
  }) {
    return qrisResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_StatusCheck value)? statusCHeck,
    required TResult orElse(),
  }) {
    if (qrisResponse != null) {
      return qrisResponse(this);
    }
    return orElse();
  }
}

abstract class _QrisResponse implements QrisState {
  const factory _QrisResponse(final QrisResponseModel qrisResponseModel) =
      _$QrisResponseImpl;

  QrisResponseModel get qrisResponseModel;
  @JsonKey(ignore: true)
  _$$QrisResponseImplCopyWith<_$QrisResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$QrisStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QrisState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QrisState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(QrisResponseModel qrisResponseModel) qrisResponse,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(QrisStatusResponseModel qrisStatusRequest)
        statusCHeck,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_StatusCheck value) statusCHeck,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_StatusCheck value)? statusCHeck,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_StatusCheck value)? statusCHeck,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements QrisState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$QrisStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessImpl with DiagnosticableTreeMixin implements _Success {
  const _$SuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QrisState.success(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QrisState.success'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(QrisResponseModel qrisResponseModel) qrisResponse,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(QrisStatusResponseModel qrisStatusRequest)
        statusCHeck,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_StatusCheck value) statusCHeck,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_StatusCheck value)? statusCHeck,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_StatusCheck value)? statusCHeck,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements QrisState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusCheckImplCopyWith<$Res> {
  factory _$$StatusCheckImplCopyWith(
          _$StatusCheckImpl value, $Res Function(_$StatusCheckImpl) then) =
      __$$StatusCheckImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QrisStatusResponseModel qrisStatusRequest});
}

/// @nodoc
class __$$StatusCheckImplCopyWithImpl<$Res>
    extends _$QrisStateCopyWithImpl<$Res, _$StatusCheckImpl>
    implements _$$StatusCheckImplCopyWith<$Res> {
  __$$StatusCheckImplCopyWithImpl(
      _$StatusCheckImpl _value, $Res Function(_$StatusCheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrisStatusRequest = null,
  }) {
    return _then(_$StatusCheckImpl(
      null == qrisStatusRequest
          ? _value.qrisStatusRequest
          : qrisStatusRequest // ignore: cast_nullable_to_non_nullable
              as QrisStatusResponseModel,
    ));
  }
}

/// @nodoc

class _$StatusCheckImpl with DiagnosticableTreeMixin implements _StatusCheck {
  const _$StatusCheckImpl(this.qrisStatusRequest);

  @override
  final QrisStatusResponseModel qrisStatusRequest;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QrisState.statusCHeck(qrisStatusRequest: $qrisStatusRequest)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QrisState.statusCHeck'))
      ..add(DiagnosticsProperty('qrisStatusRequest', qrisStatusRequest));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusCheckImpl &&
            (identical(other.qrisStatusRequest, qrisStatusRequest) ||
                other.qrisStatusRequest == qrisStatusRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qrisStatusRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusCheckImplCopyWith<_$StatusCheckImpl> get copyWith =>
      __$$StatusCheckImplCopyWithImpl<_$StatusCheckImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(QrisResponseModel qrisResponseModel) qrisResponse,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(QrisStatusResponseModel qrisStatusRequest)
        statusCHeck,
  }) {
    return statusCHeck(qrisStatusRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
  }) {
    return statusCHeck?.call(qrisStatusRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(QrisResponseModel qrisResponseModel)? qrisResponse,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(QrisStatusResponseModel qrisStatusRequest)? statusCHeck,
    required TResult orElse(),
  }) {
    if (statusCHeck != null) {
      return statusCHeck(qrisStatusRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_StatusCheck value) statusCHeck,
  }) {
    return statusCHeck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_StatusCheck value)? statusCHeck,
  }) {
    return statusCHeck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_StatusCheck value)? statusCHeck,
    required TResult orElse(),
  }) {
    if (statusCHeck != null) {
      return statusCHeck(this);
    }
    return orElse();
  }
}

abstract class _StatusCheck implements QrisState {
  const factory _StatusCheck(final QrisStatusResponseModel qrisStatusRequest) =
      _$StatusCheckImpl;

  QrisStatusResponseModel get qrisStatusRequest;
  @JsonKey(ignore: true)
  _$$StatusCheckImplCopyWith<_$StatusCheckImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
