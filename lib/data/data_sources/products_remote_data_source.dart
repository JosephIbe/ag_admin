import 'package:agoris_admin/data/core/api_client.dart';
import 'package:agoris_admin/data/core/api_constants.dart';

import 'package:agoris_admin/domain/entities/get_all_products_params.dart';

abstract class ProductsRemoteDataSource {
  Future<dynamic> getAllProducts({required GetAllProductsParams params});
}

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {

  final APIClient client;
  ProductsRemoteDataSourceImpl({required this.client});

  @override
  Future getAllProducts({required GetAllProductsParams params}) async {
    return await client.getAllProducts(pathSegment: APIConstants.getAllProducts, params: params);
  }

}