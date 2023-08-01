import 'package:hive/hive.dart';

import '../../utils/constants.dart';
import '../model/products_models.dart';

class LocalDataSource {
  LocalDataSource();

  List<ProductsModel> getHomeProducts() {
    var box = Hive.box<ProductsModel>(KHomeProductBox);
    return box.values.toList();
  }

  List<ProductsModel> getAllProducts({required int offset}) {
    int startIndex = offset * 10;
    int endIndex = (offset + 1) * 10;
    var box = Hive.box<ProductsModel>(KAllProductBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList();
  }
}

