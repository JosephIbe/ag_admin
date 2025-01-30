import 'package:agoris_admin/domain/entities/get_all_products_params.dart';

abstract class ProductsRepository {
  Future<dynamic> getAllProducts({required GetAllProductsParams params});
}