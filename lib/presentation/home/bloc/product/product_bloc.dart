import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';
import 'package:megonopos/data/datasources/product_remote_datasource.dart';
import 'package:megonopos/data/models/request/product_request_modal.dart';
import 'package:megonopos/data/models/response/product_response_model.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  List<Product> products = [];
  ProductBloc(this._productRemoteDatasource) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const ProductState.loading());
      final response = await _productRemoteDatasource.getProducts();
      response.fold(
        (l) => emit(ProductState.error(l)),
        (r) {
          products = r.result.products;
          emit(ProductState.success(r.result.products));
        },
      );
    });

    on<_FetchLocal>((event, emit) async {
      emit(const ProductState.loading());
      final localProducts =
          await ProductLocalDatasource.instance.getAllProduct();
      products = localProducts;
      emit(ProductState.success(products));
    });

    on<_FetchByCategory>((event, emit) async {
      emit(const ProductState.loading());
      final newProduct = event.category == 'all'
          ? products
          : products
              .where((element) => element.category == event.category)
              .toList();
      emit(ProductState.success(newProduct));
    });

    on<_AddProduct>((event, emit) async {
      emit(const ProductState.loading());
      final requestData = ProductRequestModel(
        name: event.product.name,
        price: event.product.price,
        stock: event.product.stock,
        category: event.product.category,
        isBestSeller: event.product.isBestSeller ? 1 : 0,
        image: event.image,
      );
      final response = await _productRemoteDatasource.addProduct(requestData);
      // products.add(newProduct);
      response.fold(
        (l) => emit(ProductState.error(l)),
        (r) {
          products.add(r.result.products);
          emit(ProductState.success(products));
        },
      );
      emit(ProductState.success(products));
    });

    on<_SearhProduct>((event, emit) async {
      emit(const ProductState.loading());
      final newProduct = products
          .where((element) =>
              element.name.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      
      emit(ProductState.success(newProduct));
    });

    on<_FetchAllFromState>((event, emit) async {
      emit(const ProductState.loading());
      
      emit(ProductState.success(products));
    });
  }
}
