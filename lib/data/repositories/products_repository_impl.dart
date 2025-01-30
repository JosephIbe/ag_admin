import 'package:agoris_admin/data/data_sources/products_remote_data_source.dart';

import 'package:agoris_admin/domain/entities/get_all_products_params.dart';

import 'package:agoris_admin/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {

  final ProductsRemoteDataSource dataSource;
  ProductsRepositoryImpl({required this.dataSource});

  @override
  Future getAllProducts({required GetAllProductsParams params}) async {
    return await dataSource.getAllProducts(params: params);
  }

}