import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/products_models.dart';
import '../../data/repository/repo.dart';
import 'package:dartz/dartz.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.repo) : super(GetProductsInitial());

  final Repo repo;

  int offset = 0;

  Future<void> getAllProducts({int offset = 0}) async {
    if (offset == 0) {
      emit(GetProductsLoading());
    }
    var result = await repo.getLatestProduct(offset: offset);
    result.fold((failure) {
      emit(GetProductsError(failure.message));
    }, (products) => emit(GetAllProductSuccess(products)));
  }

  Future<void> getHomeScreenProduct() async {
    emit(GetProductsLoading());
    var result = await repo.getHomeProduct();
    result.fold((failure) {
      emit(GetProductsError(failure.message));
    }, (products) {
      emit(GetHomeScreenProductSuccess(products));
    });
  }

  Future<void> getProductById({required int id}) async {
    emit(GetProductsLoading());

    var result = await repo.getProductById(id: id);

    result.fold((failure) {
      emit(GetProductsError(failure.message));
    }, (product) {
      emit(ProductByIdSuccess(product));
    });
  }
}
