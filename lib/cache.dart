import 'package:hive/hive.dart';

import 'data/model/products_models.dart';


void saveProductsData(List<ProductsModel> books , String boxName) {
  var box = Hive.box<ProductsModel>(boxName);
  box.addAll(books);
}