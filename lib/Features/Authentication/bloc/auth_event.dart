part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUpUser extends AuthEvent {
  final String id;
  final String password;

  SignUpUser(this.id, this.password);
}
class SignInUser extends AuthEvent {
  final String id;
  final String password;

  SignInUser(this.id, this.password);
}

class SignOut extends AuthEvent {}
