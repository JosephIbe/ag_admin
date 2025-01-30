import 'package:get_it/get_it.dart';

import 'package:agoris_admin/data/core/api_client.dart';

import 'package:agoris_admin/data/data_sources/auth_remote_data_source.dart';
import 'package:agoris_admin/data/data_sources/products_remote_data_source.dart';

import 'package:agoris_admin/data/repositories/auth_repository_impl.dart';
import 'package:agoris_admin/data/repositories/products_repository_impl.dart';

import 'package:agoris_admin/domain/repositories/auth_repository.dart';
import 'package:agoris_admin/domain/repositories/products_repository.dart';

import 'package:agoris_admin/presentation/blocs/auth/auth_bloc.dart';
import 'package:agoris_admin/presentation/blocs/products/products_bloc.dart';

final inject = GetIt.I;

Future init() async {

  inject.registerLazySingleton<APIClient>(() => APIClient());

  inject.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(client: inject()));
  inject.registerLazySingleton<ProductsRemoteDataSource>(() => ProductsRemoteDataSourceImpl(client: inject()));

  inject.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dataSource: inject()));
  inject.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(dataSource: inject()));

  inject.registerFactory(() => AuthBloc(repository: inject()));
  inject.registerFactory(() => ProductsBloc(repository: inject()));

}