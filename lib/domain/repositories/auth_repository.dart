import 'package:agoris_admin/domain/entities/change_password_params.dart';
import 'package:agoris_admin/domain/entities/forgot_password_params.dart';
import 'package:agoris_admin/domain/entities/login_params.dart';

abstract class AuthRepository {
  Future<dynamic> loginUser({required LoginParams params});
  Future<dynamic> forgotPassword({required ForgotPasswordParams params});
  Future<dynamic> changePassword({required ChangePasswordParams params});
}