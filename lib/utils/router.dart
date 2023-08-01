import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/utils/routs.dart';

import '../business_logic/get_products_cubit/get_products_cubit.dart';
import '../data/model/products_models.dart';
import '../data/repository/repo.dart';
import '../injection.dart';
import '../presentation/screens/all_products.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/product_details.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider<GetProductsCubit>(
          create: (context) => GetProductsCubit(getIt.get<Repo>()),

          child: const HomeScreen(),
        ),
        settings: settings,
      );

    case AppRoutes.productDetails:
      final products = settings.arguments as ProductsModel;
      return MaterialPageRoute(
        builder: (_) => BlocProvider<GetProductsCubit>.value(
          value: GetProductsCubit(getIt.get<Repo>()),
          child: ProductDetails(id: products.id!),
        ),
        settings: settings,
      );

    case AppRoutes.allProducts:
      return MaterialPageRoute(
        builder: (_) => BlocProvider<GetProductsCubit>.value(
          value: GetProductsCubit(getIt.get<Repo>()),
          child: const AllProducts(),
        ),
        settings: settings,
      );

    // case AppRoutes.categoriesScreen:
    //   return MaterialPageRoute(
    //     builder: (_) => BlocProvider(
    //       create: (context) =>
    //           GetCategoriesCubit(getIt.get<Repo>())..getCategories(),
    //       child: const CategoriesScreen(),
    //     ),
    //     settings: settings,
    //   );
    //
    // case AppRoutes.usersScreen:
    //   return MaterialPageRoute(
    //     builder: (_) => BlocProvider(
    //       create: (context) => GetAllUsersCubit(getIt.get<Repo>()),
    //       child: const UsersScreen(),
    //     ),
    //     settings: settings,
    //   );

    default:
      return MaterialPageRoute(
        builder: (_) => BlocProvider<GetProductsCubit>(
          create: (context) => GetProductsCubit(getIt.get<Repo>()),
          child: const HomeScreen(),
        ),
        settings: settings,
      );
  }
}
