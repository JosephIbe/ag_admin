import 'dart:convert';
import 'dart:developer';

import 'package:agoris_admin/common/db_constants.dart';

import 'package:agoris_admin/data/models/error_response_model.dart';
// import 'package:agoris_admin/data/models/login_response_model.dart';

import 'package:agoris_admin/domain/entities/change_password_params.dart';
import 'package:agoris_admin/domain/entities/forgot_password_params.dart';
import 'package:agoris_admin/domain/entities/login_params.dart';

import 'package:agoris_admin/domain/repositories/auth_repository.dart';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthRepository _repository;

  AuthBloc({required AuthRepository repository})
      : _repository = repository,
        super(AuthStateUnAuthenticated()) {
    on<LoginEvent>(_loginUser);
    on<ForgotPasswordEvent>(_forgotPassword);
    on<ChangePasswordEvent>(_changePassword);
    on<BackStackEvent>(_backStack);
  }

  _loginUser(LoginEvent event, Emitter<AuthState> emit) async {
    // emit(AuthStateLoading());

    emit(AuthStateAuthenticated());

    // http.Response response = await _repository.loginUser(params: event.loginParams);

    // final box = Hive.box(DBConstants.appBoxName);

    // if(response.statusCode == 200){
      // // final loginResponseModel = LoginResponseModel.fromJson(jsonDecode(response.body));
      //
      // box.put(DBConstants.userId, loginResponseModel.user.id);
      // box.put(DBConstants.firstName, loginResponseModel.user.firstName);
      // box.put(DBConstants.lastName, loginResponseModel.user.lastName);
      // box.put(DBConstants.email, loginResponseModel.user.email);
      // box.put(DBConstants.jwtToken, loginResponseModel.token);
      // // box.put(DBConstants.isLoggedIn, true);
      // //
      // log('fn from response:\t${loginResponseModel.user.firstName}');
      //
      // // emit(AuthStateAuthenticated());
      // emit(AuthStateLoginSuccess(responseModel: loginResponseModel));
    //
    // } else {
    //
    //   final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
    //   log('failure in bloc:\n${failure.message}');
    //   emit(AuthStateFailure(failureMessage: failure.message));
    // }

  }

  _forgotPassword(ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());

    http.Response response = await _repository.forgotPassword(params: event.params);

    if(response.statusCode == 200){
      emit(AuthStateForgotPasswordSuccess());
    } else {

      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      log('failure in bloc:\n${failure.message}');
      emit(AuthStateFailure(failureMessage: failure.message));
    }

  }

  _changePassword(ChangePasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());

    http.Response response = await _repository.changePassword(params: event.params);

    if(response.statusCode == 200){
      emit(AuthStateChangePasswordSuccess());
    } else {
      final failure = ErrorResponseModel.fromJson(jsonDecode(jsonEncode(response.body)));
      log('failure in bloc:\n${failure.message}');
      emit(AuthStateFailure(failureMessage: failure.message));
    }

  }

  _backStack(BackStackEvent event, Emitter<AuthState> emit) {
    if(state is AuthStateLoading) {
      emit(AuthStateInitial());
    }
    emit(AuthStateInitial());
  }

}