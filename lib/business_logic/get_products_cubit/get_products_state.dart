part of 'get_products_cubit.dart';

@immutable
abstract class GetProductsState {}

class GetProductsInitial extends GetProductsState {}

class GetProductsLoading extends GetProductsState {}


class GetProductsError extends GetProductsState {
  final String errMessage;

  GetProductsError(this.errMessage);
}

class GetHomeScreenProductSuccess extends GetProductsState {
  final List<ProductsModel> product;

  GetHomeScreenProductSuccess(this.product);
}

class ProductByIdSuccess extends GetProductsState {
  final ProductsModel product;

  ProductByIdSuccess(this.product);
}

class GetAllProductSuccess extends GetProductsState {
  final List<ProductsModel> products;

  GetAllProductSuccess(this.products);
}
