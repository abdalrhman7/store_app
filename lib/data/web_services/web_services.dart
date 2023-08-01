import 'package:dio/dio.dart';
import 'package:store_app/data/model/products_models.dart';
import 'package:store_app/utils/constants.dart';

import '../../cache.dart';
import '../../utils/api_constants..dart';

class WebServices {
  WebServices(this._dio);

  final Dio _dio;

  Future<List<ProductsModel>> getHomeProduct() async {
    Response response = await _dio.get(productUrl , queryParameters: {'offset': '0', 'limit': '2'});
    List<ProductsModel> products = List<ProductsModel>.from((response.data as List)
        .map((product) => ProductsModel.fromJson(product)));
    saveProductsData(products , KHomeProductBox);
    return products;
  }

  Future<List<ProductsModel>> getLatestProducts({required int offset}) async {
    Response response = await _dio
        .get(productUrl, queryParameters: {'offset': offset, 'limit': '10'});
    List<ProductsModel> products = List<ProductsModel>.from((response.data as List)
        .map((product) => ProductsModel.fromJson(product)));
    saveProductsData(products , KAllProductBox);
    return products;
  }

  Future<ProductsModel> getProductById({required int id}) async {
    Response response = await _dio.get('$productByIdUrl$id');
    return ProductsModel.fromJson(response.data);
  }
}
