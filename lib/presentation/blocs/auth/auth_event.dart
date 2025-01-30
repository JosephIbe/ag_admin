part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];

}

class LoginEvent extends AuthEvent {

  final LoginParams loginParams;
  const LoginEvent({required this.loginParams});

}

class ForgotPasswordEvent extends AuthEvent {
  final ForgotPasswordParams params;
  const ForgotPasswordEvent({required this.params});

  @override
  List<Object?> get props =>  [params];

}

class ChangePasswordEvent extends AuthEvent {

  final ChangePasswordParams params;
  const ChangePasswordEvent({required this.params});

  @override
  List<Object?> get props =>  [params];

}

class BackStackEvent extends AuthEvent {}