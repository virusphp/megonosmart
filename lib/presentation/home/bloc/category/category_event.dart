part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.started() = _Started;
  const factory CategoryEvent.getCategories() = _GetCategories;
  //get categories from local
  const factory CategoryEvent.getCategoriesLocal() = _GetCategoriesLocal;
}
