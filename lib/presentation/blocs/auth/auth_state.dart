part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];

}

class AuthStateInitial extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateFailure extends AuthState {

  final String failureMessage;
  const AuthStateFailure({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];

}

class AuthStateAuthenticated extends AuthState {}

class AuthStateUnAuthenticated extends AuthState {}

class AuthStateForgotPasswordSuccess extends AuthState {}

class AuthStateChangePasswordSuccess extends AuthState {}

class VerifyOTPStateSuccess extends AuthState {}

class VerifyOTPStateFailure extends AuthState {}