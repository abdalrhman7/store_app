import 'package:dio/dio.dart';

import '../../utils/failure.dart';
import '../local_data_source/local_data_source.dart';
import '../model/products_models.dart';
import '../web_services/web_services.dart';
import 'package:dartz/dartz.dart';

class Repo {
  final WebServices webServices;
  final LocalDataSource localDataSource;

  Repo(this.webServices, this.localDataSource);

  Future<Either<Failure, List<ProductsModel>>> getHomeProduct() async {
    List<ProductsModel> products;
    products = localDataSource.getHomeProducts();
    try {
      if (products.isNotEmpty) {
        return Right(products);
      }
      products = await webServices.getHomeProduct();
      return Right(products);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<ProductsModel>>> getLatestProduct(
      {required int offset}) async {
    List<ProductsModel> products;
    products = localDataSource.getAllProducts(offset: offset);
    try {
      if (products.isNotEmpty) {
        return Right(products);
      }
      products = await webServices.getLatestProducts(offset: offset);
      return Right(products);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, ProductsModel>> getProductById(
      {required int id}) async {
    try {
      var product = await webServices.getProductById(id: id);

      return right(product);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
