import 'package:agoris_admin/data/core/api_client.dart';
import 'package:agoris_admin/data/core/api_constants.dart';

import 'package:agoris_admin/domain/entities/change_password_params.dart';
import 'package:agoris_admin/domain/entities/forgot_password_params.dart';
import 'package:agoris_admin/domain/entities/login_params.dart';

abstract class AuthRemoteDataSource {
  Future<dynamic> loginUser({required LoginParams params});
  Future<dynamic> forgotPassword({required ForgotPasswordParams params});
  Future<dynamic> changePassword({required ChangePasswordParams params});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {

  final APIClient client;
  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<void> loginUser({required LoginParams params}) async {
    return await client.login(pathSegment: APIConstants.login, params: params);
  }

  @override
  Future<void> forgotPassword({required ForgotPasswordParams params}) async {
    return await client.forgotPassword(pathSegment: APIConstants.forgotPassword, params: params);
  }

  @override
  Future<void> changePassword({required ChangePasswordParams params}) async {
    return await client.changePassword(pathSegment: APIConstants.changePassword, params: params);
  }

}