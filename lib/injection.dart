import 'package:get_it/get_it.dart';
import 'package:store_app/data/local_data_source/local_data_source.dart';
import 'package:store_app/utils/setup_dio.dart';

import 'business_logic/get_products_cubit/get_products_cubit.dart';
import 'data/repository/repo.dart';
import 'data/web_services/web_services.dart';

final getIt = GetIt.instance;

void initGetIt() {

  ///

  ///Bloc
  getIt
      .registerLazySingleton<GetProductsCubit>(() => GetProductsCubit(getIt()));

  ///Repo
  getIt.registerLazySingleton<Repo>(() => Repo(getIt(), LocalDataSource()));

  ///Wep_Services
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}
