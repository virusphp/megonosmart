import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';
import 'package:megonopos/data/datasources/product_remote_datasource.dart';
import 'package:megonopos/data/models/response/category_response_model.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ProductRemoteDatasource productRemoteDatasource;
  List<Category> categories = [];
  CategoryBloc(
    this.productRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetCategories>((event, emit) async {
      emit(const _Loading());
      final result = await productRemoteDatasource.getCategories();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.result!.categories!)),
      );
    });

    on<_GetCategoriesLocal>((event, emit) async {
      emit(const _Loading());
      categories = await ProductLocalDatasource.instance.getAllCategories();
      print(categories);

      emit(_LoadedLocal(categories));
    });
  }
}
