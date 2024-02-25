part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {
  AuthLoadingState();
}

class AuthenticatedState extends AuthState {
  final UserModel user;

  AuthenticatedState(this.user);
}
class UnauthenticatedState extends AuthState {
  UnauthenticatedState();
}


class AuthFailureState extends AuthState {
  final String errorMessage;

  AuthFailureState(this.errorMessage);
}
