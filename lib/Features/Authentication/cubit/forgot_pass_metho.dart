import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<int?> {
  ForgotPasswordCubit() : super(null);

  selectMethod(int selectedIndex){
    emit(selectedIndex);
  }
}