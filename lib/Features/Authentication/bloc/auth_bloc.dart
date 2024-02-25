import 'package:bloc/bloc.dart';
import 'package:brain_pulse/Features/Authentication/auth_service.dart';
import 'package:brain_pulse/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService = AuthService();
  AuthBloc() : super(AuthInitialState()) {
    on<SignUpUser>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final email = "${event.id}@gmail.com";
        final UserModel? user =
            await authService.signUpUser(email, event.password);
        if (user != null) {
          emit(AuthenticatedState(user));
        } else {
          emit(AuthFailureState('Sign Up Failed'));
        }
      } catch (e) {
        emit(AuthFailureState(e.toString()));
      }
    });
    on<SignInUser>((event, emit) async {
      emit(AuthLoadingState());
      final email = "${event.id}@gmail.com";
      try {
        UserModel? userCredential = await authService.signInUser(
          email,
          event.password,
        );
        if (userCredential != null) {
          emit(AuthenticatedState(userCredential));
        } else {
          emit(AuthFailureState('Please Check Your Credentials'));
          print(state);
        }
      } catch (e) {
        emit(AuthFailureState(e.toString()));
      }
    });

    on<SignOut>((event, emit) async {
      emit(AuthLoadingState());
      try {
        authService.signOutUser();
      } catch (e) {
        print('error');
        print(e.toString());
      }
      emit(UnauthenticatedState());
    });
  }
}
