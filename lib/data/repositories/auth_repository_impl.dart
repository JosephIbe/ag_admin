import 'package:agoris_admin/data/data_sources/auth_remote_data_source.dart';

import 'package:agoris_admin/domain/entities/change_password_params.dart';
import 'package:agoris_admin/domain/entities/forgot_password_params.dart';
import 'package:agoris_admin/domain/entities/login_params.dart';

import 'package:agoris_admin/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {

  final AuthRemoteDataSource dataSource;
  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<dynamic> loginUser({required LoginParams params}) async {
    return await dataSource.loginUser(params: params);
  }

  @override
  Future<dynamic> forgotPassword({required ForgotPasswordParams params}) async {
    return await dataSource.forgotPassword(params: params);
  }

  @override
  Future<dynamic> changePassword({required ChangePasswordParams params}) async {
    return await dataSource.changePassword(params: params);
  }

}