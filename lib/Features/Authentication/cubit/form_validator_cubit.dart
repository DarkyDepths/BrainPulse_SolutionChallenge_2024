import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'form_validator_state.dart';

class FormValidatorCubit extends Cubit<FormValidatorState> {
  FormValidatorCubit() : super(const FormValidatorUpdate());

  void initForm({
    String ID = '',
    String password = '',
  }) {
    emit(state.copyWith(
      ID: ID,
      password: password,
    ));
  }

  void updateID(String? ID) {
    emit(state.copyWith(ID: ID));
  }

  void updatePassword(String? password) {
    emit(state.copyWith(password: password));
  }

  void toggleObscureText() {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void toggleIsErrorID(bool value) {
    emit(state.copyWith(isErrorID: value));
  }

  void toggleIsSelectedID() {
    emit(state.copyWith(isSelectedID: !state.isSelectedID));
  }

  void toggleIsSelectedPassword() {
    emit(state.copyWith(isSelectedPassword: !state.isSelectedPassword));
  }

  void toggleIsErrorPassword(bool value) {
    emit(state.copyWith(isErrorPassword: value));
  }

  void toggleIsConfirmPasswordMismatch(bool value) {
    emit(state.copyWith(isConfirmPasswordMismatch: value));
  }

  void toggleIsConfirmPasswordNull(bool value) {
    emit(state.copyWith(isConfirmPasswordNull: value));
  }

  void toggleIsSelectedConfirmPassword() {
    emit(state.copyWith(
        isSelectedConfirmPassword: !state.isSelectedConfirmPassword));
  }

  void reset() {
    emit(const FormValidatorUpdate());
  }
}
