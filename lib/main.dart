
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:store_app/utils/constants.dart';
import 'package:store_app/utils/router.dart';
import 'package:store_app/utils/theme_data.dart';

import 'package:hive_flutter/adapters.dart';

import 'data/model/categories_models.dart';
import 'data/model/products_models.dart';
import 'injection.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductsModelAdapter());
  Hive.registerAdapter(CategoriesModelAdapter());
  await Hive.openBox<ProductsModel>(KHomeProductBox);
  await Hive.openBox<ProductsModel>(KAllProductBox);
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(context),
      onGenerateRoute: generateRoute,
    );
  }
}
