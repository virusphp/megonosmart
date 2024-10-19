part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.loading() = _Loading;
  const factory CategoryState.loaded(List<Category> categories) = _Loaded;
  //loaded from local
  const factory CategoryState.loadedLocal(List<Category> categories) =
      _LoadedLocal;
  const factory CategoryState.error(String message) = _Error;
}
