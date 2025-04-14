// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) addCheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) removeProduct,
    required TResult Function(int tableNumber, String draftName) saveDraftOrder,
    required TResult Function(DraftOrderModel data) loadDraftOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? addCheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? removeProduct,
    TResult? Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult? Function(DraftOrderModel data)? loadDraftOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? addCheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? removeProduct,
    TResult Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult Function(DraftOrderModel data)? loadDraftOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCheckout value) addCheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_SaveDraftOrder value) saveDraftOrder,
    required TResult Function(_LoadDraftOrder value) loadDraftOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCheckout value)? addCheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult? Function(_LoadDraftOrder value)? loadDraftOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCheckout value)? addCheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult Function(_LoadDraftOrder value)? loadDraftOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutEventCopyWith<$Res> {
  factory $CheckoutEventCopyWith(
          CheckoutEvent value, $Res Function(CheckoutEvent) then) =
      _$CheckoutEventCopyWithImpl<$Res, CheckoutEvent>;
}

/// @nodoc
class _$CheckoutEventCopyWithImpl<$Res, $Val extends CheckoutEvent>
    implements $CheckoutEventCopyWith<$Res> {
  _$CheckoutEventCopyWithImpl(this._value, this._then);

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
    extends _$CheckoutEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CheckoutEvent.started()';
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
    required TResult Function(Product product) addCheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) removeProduct,
    required TResult Function(int tableNumber, String draftName) saveDraftOrder,
    required TResult Function(DraftOrderModel data) loadDraftOrder,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? addCheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? removeProduct,
    TResult? Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult? Function(DraftOrderModel data)? loadDraftOrder,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? addCheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? removeProduct,
    TResult Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult Function(DraftOrderModel data)? loadDraftOrder,
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
    required TResult Function(_AddCheckout value) addCheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_SaveDraftOrder value) saveDraftOrder,
    required TResult Function(_LoadDraftOrder value) loadDraftOrder,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCheckout value)? addCheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult? Function(_LoadDraftOrder value)? loadDraftOrder,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCheckout value)? addCheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult Function(_LoadDraftOrder value)? loadDraftOrder,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CheckoutEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$AddCheckoutImplCopyWith<$Res> {
  factory _$$AddCheckoutImplCopyWith(
          _$AddCheckoutImpl value, $Res Function(_$AddCheckoutImpl) then) =
      __$$AddCheckoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$AddCheckoutImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$AddCheckoutImpl>
    implements _$$AddCheckoutImplCopyWith<$Res> {
  __$$AddCheckoutImplCopyWithImpl(
      _$AddCheckoutImpl _value, $Res Function(_$AddCheckoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$AddCheckoutImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$AddCheckoutImpl implements _AddCheckout {
  const _$AddCheckoutImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'CheckoutEvent.addCheckout(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCheckoutImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCheckoutImplCopyWith<_$AddCheckoutImpl> get copyWith =>
      __$$AddCheckoutImplCopyWithImpl<_$AddCheckoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) addCheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) removeProduct,
    required TResult Function(int tableNumber, String draftName) saveDraftOrder,
    required TResult Function(DraftOrderModel data) loadDraftOrder,
  }) {
    return addCheckout(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? addCheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? removeProduct,
    TResult? Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult? Function(DraftOrderModel data)? loadDraftOrder,
  }) {
    return addCheckout?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? addCheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? removeProduct,
    TResult Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult Function(DraftOrderModel data)? loadDraftOrder,
    required TResult orElse(),
  }) {
    if (addCheckout != null) {
      return addCheckout(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCheckout value) addCheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_SaveDraftOrder value) saveDraftOrder,
    required TResult Function(_LoadDraftOrder value) loadDraftOrder,
  }) {
    return addCheckout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCheckout value)? addCheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult? Function(_LoadDraftOrder value)? loadDraftOrder,
  }) {
    return addCheckout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCheckout value)? addCheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult Function(_LoadDraftOrder value)? loadDraftOrder,
    required TResult orElse(),
  }) {
    if (addCheckout != null) {
      return addCheckout(this);
    }
    return orElse();
  }
}

abstract class _AddCheckout implements CheckoutEvent {
  const factory _AddCheckout(final Product product) = _$AddCheckoutImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$AddCheckoutImplCopyWith<_$AddCheckoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveCheckoutImplCopyWith<$Res> {
  factory _$$RemoveCheckoutImplCopyWith(_$RemoveCheckoutImpl value,
          $Res Function(_$RemoveCheckoutImpl) then) =
      __$$RemoveCheckoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$RemoveCheckoutImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$RemoveCheckoutImpl>
    implements _$$RemoveCheckoutImplCopyWith<$Res> {
  __$$RemoveCheckoutImplCopyWithImpl(
      _$RemoveCheckoutImpl _value, $Res Function(_$RemoveCheckoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$RemoveCheckoutImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$RemoveCheckoutImpl implements _RemoveCheckout {
  const _$RemoveCheckoutImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'CheckoutEvent.removeCheckout(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveCheckoutImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveCheckoutImplCopyWith<_$RemoveCheckoutImpl> get copyWith =>
      __$$RemoveCheckoutImplCopyWithImpl<_$RemoveCheckoutImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) addCheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) removeProduct,
    required TResult Function(int tableNumber, String draftName) saveDraftOrder,
    required TResult Function(DraftOrderModel data) loadDraftOrder,
  }) {
    return removeCheckout(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? addCheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? removeProduct,
    TResult? Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult? Function(DraftOrderModel data)? loadDraftOrder,
  }) {
    return removeCheckout?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? addCheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? removeProduct,
    TResult Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult Function(DraftOrderModel data)? loadDraftOrder,
    required TResult orElse(),
  }) {
    if (removeCheckout != null) {
      return removeCheckout(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCheckout value) addCheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_SaveDraftOrder value) saveDraftOrder,
    required TResult Function(_LoadDraftOrder value) loadDraftOrder,
  }) {
    return removeCheckout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCheckout value)? addCheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult? Function(_LoadDraftOrder value)? loadDraftOrder,
  }) {
    return removeCheckout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCheckout value)? addCheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult Function(_LoadDraftOrder value)? loadDraftOrder,
    required TResult orElse(),
  }) {
    if (removeCheckout != null) {
      return removeCheckout(this);
    }
    return orElse();
  }
}

abstract class _RemoveCheckout implements CheckoutEvent {
  const factory _RemoveCheckout(final Product product) = _$RemoveCheckoutImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$RemoveCheckoutImplCopyWith<_$RemoveCheckoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveProductImplCopyWith<$Res> {
  factory _$$RemoveProductImplCopyWith(
          _$RemoveProductImpl value, $Res Function(_$RemoveProductImpl) then) =
      __$$RemoveProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$RemoveProductImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$RemoveProductImpl>
    implements _$$RemoveProductImplCopyWith<$Res> {
  __$$RemoveProductImplCopyWithImpl(
      _$RemoveProductImpl _value, $Res Function(_$RemoveProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$RemoveProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$RemoveProductImpl implements _RemoveProduct {
  const _$RemoveProductImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'CheckoutEvent.removeProduct(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveProductImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveProductImplCopyWith<_$RemoveProductImpl> get copyWith =>
      __$$RemoveProductImplCopyWithImpl<_$RemoveProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) addCheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) removeProduct,
    required TResult Function(int tableNumber, String draftName) saveDraftOrder,
    required TResult Function(DraftOrderModel data) loadDraftOrder,
  }) {
    return removeProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? addCheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? removeProduct,
    TResult? Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult? Function(DraftOrderModel data)? loadDraftOrder,
  }) {
    return removeProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? addCheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? removeProduct,
    TResult Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult Function(DraftOrderModel data)? loadDraftOrder,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCheckout value) addCheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_SaveDraftOrder value) saveDraftOrder,
    required TResult Function(_LoadDraftOrder value) loadDraftOrder,
  }) {
    return removeProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCheckout value)? addCheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult? Function(_LoadDraftOrder value)? loadDraftOrder,
  }) {
    return removeProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCheckout value)? addCheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult Function(_LoadDraftOrder value)? loadDraftOrder,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(this);
    }
    return orElse();
  }
}

abstract class _RemoveProduct implements CheckoutEvent {
  const factory _RemoveProduct(final Product product) = _$RemoveProductImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$RemoveProductImplCopyWith<_$RemoveProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveDraftOrderImplCopyWith<$Res> {
  factory _$$SaveDraftOrderImplCopyWith(_$SaveDraftOrderImpl value,
          $Res Function(_$SaveDraftOrderImpl) then) =
      __$$SaveDraftOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int tableNumber, String draftName});
}

/// @nodoc
class __$$SaveDraftOrderImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$SaveDraftOrderImpl>
    implements _$$SaveDraftOrderImplCopyWith<$Res> {
  __$$SaveDraftOrderImplCopyWithImpl(
      _$SaveDraftOrderImpl _value, $Res Function(_$SaveDraftOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableNumber = null,
    Object? draftName = null,
  }) {
    return _then(_$SaveDraftOrderImpl(
      null == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int,
      null == draftName
          ? _value.draftName
          : draftName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveDraftOrderImpl implements _SaveDraftOrder {
  const _$SaveDraftOrderImpl(this.tableNumber, this.draftName);

  @override
  final int tableNumber;
  @override
  final String draftName;

  @override
  String toString() {
    return 'CheckoutEvent.saveDraftOrder(tableNumber: $tableNumber, draftName: $draftName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveDraftOrderImpl &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.draftName, draftName) ||
                other.draftName == draftName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableNumber, draftName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveDraftOrderImplCopyWith<_$SaveDraftOrderImpl> get copyWith =>
      __$$SaveDraftOrderImplCopyWithImpl<_$SaveDraftOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) addCheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) removeProduct,
    required TResult Function(int tableNumber, String draftName) saveDraftOrder,
    required TResult Function(DraftOrderModel data) loadDraftOrder,
  }) {
    return saveDraftOrder(tableNumber, draftName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? addCheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? removeProduct,
    TResult? Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult? Function(DraftOrderModel data)? loadDraftOrder,
  }) {
    return saveDraftOrder?.call(tableNumber, draftName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? addCheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? removeProduct,
    TResult Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult Function(DraftOrderModel data)? loadDraftOrder,
    required TResult orElse(),
  }) {
    if (saveDraftOrder != null) {
      return saveDraftOrder(tableNumber, draftName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCheckout value) addCheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_SaveDraftOrder value) saveDraftOrder,
    required TResult Function(_LoadDraftOrder value) loadDraftOrder,
  }) {
    return saveDraftOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCheckout value)? addCheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult? Function(_LoadDraftOrder value)? loadDraftOrder,
  }) {
    return saveDraftOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCheckout value)? addCheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult Function(_LoadDraftOrder value)? loadDraftOrder,
    required TResult orElse(),
  }) {
    if (saveDraftOrder != null) {
      return saveDraftOrder(this);
    }
    return orElse();
  }
}

abstract class _SaveDraftOrder implements CheckoutEvent {
  const factory _SaveDraftOrder(final int tableNumber, final String draftName) =
      _$SaveDraftOrderImpl;

  int get tableNumber;
  String get draftName;
  @JsonKey(ignore: true)
  _$$SaveDraftOrderImplCopyWith<_$SaveDraftOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadDraftOrderImplCopyWith<$Res> {
  factory _$$LoadDraftOrderImplCopyWith(_$LoadDraftOrderImpl value,
          $Res Function(_$LoadDraftOrderImpl) then) =
      __$$LoadDraftOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DraftOrderModel data});
}

/// @nodoc
class __$$LoadDraftOrderImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$LoadDraftOrderImpl>
    implements _$$LoadDraftOrderImplCopyWith<$Res> {
  __$$LoadDraftOrderImplCopyWithImpl(
      _$LoadDraftOrderImpl _value, $Res Function(_$LoadDraftOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadDraftOrderImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DraftOrderModel,
    ));
  }
}

/// @nodoc

class _$LoadDraftOrderImpl implements _LoadDraftOrder {
  const _$LoadDraftOrderImpl(this.data);

  @override
  final DraftOrderModel data;

  @override
  String toString() {
    return 'CheckoutEvent.loadDraftOrder(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadDraftOrderImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDraftOrderImplCopyWith<_$LoadDraftOrderImpl> get copyWith =>
      __$$LoadDraftOrderImplCopyWithImpl<_$LoadDraftOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Product product) addCheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) removeProduct,
    required TResult Function(int tableNumber, String draftName) saveDraftOrder,
    required TResult Function(DraftOrderModel data) loadDraftOrder,
  }) {
    return loadDraftOrder(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Product product)? addCheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? removeProduct,
    TResult? Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult? Function(DraftOrderModel data)? loadDraftOrder,
  }) {
    return loadDraftOrder?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Product product)? addCheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? removeProduct,
    TResult Function(int tableNumber, String draftName)? saveDraftOrder,
    TResult Function(DraftOrderModel data)? loadDraftOrder,
    required TResult orElse(),
  }) {
    if (loadDraftOrder != null) {
      return loadDraftOrder(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddCheckout value) addCheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_SaveDraftOrder value) saveDraftOrder,
    required TResult Function(_LoadDraftOrder value) loadDraftOrder,
  }) {
    return loadDraftOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddCheckout value)? addCheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult? Function(_LoadDraftOrder value)? loadDraftOrder,
  }) {
    return loadDraftOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddCheckout value)? addCheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_SaveDraftOrder value)? saveDraftOrder,
    TResult Function(_LoadDraftOrder value)? loadDraftOrder,
    required TResult orElse(),
  }) {
    if (loadDraftOrder != null) {
      return loadDraftOrder(this);
    }
    return orElse();
  }
}

abstract class _LoadDraftOrder implements CheckoutEvent {
  const factory _LoadDraftOrder(final DraftOrderModel data) =
      _$LoadDraftOrderImpl;

  DraftOrderModel get data;
  @JsonKey(ignore: true)
  _$$LoadDraftOrderImplCopyWith<_$LoadDraftOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CheckoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)
        success,
    required TResult Function(String message) error,
    required TResult Function() savedDraftOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)?
        success,
    TResult? Function(String message)? error,
    TResult? Function()? savedDraftOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)?
        success,
    TResult Function(String message)? error,
    TResult Function()? savedDraftOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SavedDraftOrder value) savedDraftOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SavedDraftOrder value)? savedDraftOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SavedDraftOrder value)? savedDraftOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

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
    extends _$CheckoutStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CheckoutState.initial()';
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
    required TResult Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)
        success,
    required TResult Function(String message) error,
    required TResult Function() savedDraftOrder,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)?
        success,
    TResult? Function(String message)? error,
    TResult? Function()? savedDraftOrder,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)?
        success,
    TResult Function(String message)? error,
    TResult Function()? savedDraftOrder,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SavedDraftOrder value) savedDraftOrder,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SavedDraftOrder value)? savedDraftOrder,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SavedDraftOrder value)? savedDraftOrder,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CheckoutState {
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
    extends _$CheckoutStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CheckoutState.loading()';
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
    required TResult Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)
        success,
    required TResult Function(String message) error,
    required TResult Function() savedDraftOrder,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)?
        success,
    TResult? Function(String message)? error,
    TResult? Function()? savedDraftOrder,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)?
        success,
    TResult Function(String message)? error,
    TResult Function()? savedDraftOrder,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SavedDraftOrder value) savedDraftOrder,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SavedDraftOrder value)? savedDraftOrder,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SavedDraftOrder value)? savedDraftOrder,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CheckoutState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<OrderItem> products,
      int totalQuantity,
      int totalPrice,
      String draftName});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? totalQuantity = null,
    Object? totalPrice = null,
    Object? draftName = null,
  }) {
    return _then(_$SuccessImpl(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      null == draftName
          ? _value.draftName
          : draftName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<OrderItem> products, this.totalQuantity,
      this.totalPrice, this.draftName)
      : _products = products;

  final List<OrderItem> _products;
  @override
  List<OrderItem> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final int totalQuantity;
  @override
  final int totalPrice;
  @override
  final String draftName;

  @override
  String toString() {
    return 'CheckoutState.success(products: $products, totalQuantity: $totalQuantity, totalPrice: $totalPrice, draftName: $draftName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.draftName, draftName) ||
                other.draftName == draftName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      totalQuantity,
      totalPrice,
      draftName);

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
    required TResult Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)
        success,
    required TResult Function(String message) error,
    required TResult Function() savedDraftOrder,
  }) {
    return success(products, totalQuantity, totalPrice, draftName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)?
        success,
    TResult? Function(String message)? error,
    TResult? Function()? savedDraftOrder,
  }) {
    return success?.call(products, totalQuantity, totalPrice, draftName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)?
        success,
    TResult Function(String message)? error,
    TResult Function()? savedDraftOrder,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(products, totalQuantity, totalPrice, draftName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SavedDraftOrder value) savedDraftOrder,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SavedDraftOrder value)? savedDraftOrder,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SavedDraftOrder value)? savedDraftOrder,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CheckoutState {
  const factory _Success(
      final List<OrderItem> products,
      final int totalQuantity,
      final int totalPrice,
      final String draftName) = _$SuccessImpl;

  List<OrderItem> get products;
  int get totalQuantity;
  int get totalPrice;
  String get draftName;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
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
    extends _$CheckoutStateCopyWithImpl<$Res, _$ErrorImpl>
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

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CheckoutState.error(message: $message)';
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
    required TResult Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)
        success,
    required TResult Function(String message) error,
    required TResult Function() savedDraftOrder,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)?
        success,
    TResult? Function(String message)? error,
    TResult? Function()? savedDraftOrder,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)?
        success,
    TResult Function(String message)? error,
    TResult Function()? savedDraftOrder,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SavedDraftOrder value) savedDraftOrder,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SavedDraftOrder value)? savedDraftOrder,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SavedDraftOrder value)? savedDraftOrder,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CheckoutState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SavedDraftOrderImplCopyWith<$Res> {
  factory _$$SavedDraftOrderImplCopyWith(_$SavedDraftOrderImpl value,
          $Res Function(_$SavedDraftOrderImpl) then) =
      __$$SavedDraftOrderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavedDraftOrderImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$SavedDraftOrderImpl>
    implements _$$SavedDraftOrderImplCopyWith<$Res> {
  __$$SavedDraftOrderImplCopyWithImpl(
      _$SavedDraftOrderImpl _value, $Res Function(_$SavedDraftOrderImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SavedDraftOrderImpl implements _SavedDraftOrder {
  const _$SavedDraftOrderImpl();

  @override
  String toString() {
    return 'CheckoutState.savedDraftOrder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SavedDraftOrderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)
        success,
    required TResult Function(String message) error,
    required TResult Function() savedDraftOrder,
  }) {
    return savedDraftOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)?
        success,
    TResult? Function(String message)? error,
    TResult? Function()? savedDraftOrder,
  }) {
    return savedDraftOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderItem> products, int totalQuantity,
            int totalPrice, String draftName)?
        success,
    TResult Function(String message)? error,
    TResult Function()? savedDraftOrder,
    required TResult orElse(),
  }) {
    if (savedDraftOrder != null) {
      return savedDraftOrder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SavedDraftOrder value) savedDraftOrder,
  }) {
    return savedDraftOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SavedDraftOrder value)? savedDraftOrder,
  }) {
    return savedDraftOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SavedDraftOrder value)? savedDraftOrder,
    required TResult orElse(),
  }) {
    if (savedDraftOrder != null) {
      return savedDraftOrder(this);
    }
    return orElse();
  }
}

abstract class _SavedDraftOrder implements CheckoutState {
  const factory _SavedDraftOrder() = _$SavedDraftOrderImpl;
}
