part of 'form_validator_cubit.dart';

@immutable
abstract class FormValidatorState {
  final String ID;
  final String password;
  final bool obscureText;
  final bool isErrorID;
  final bool isErrorPassword;
  final bool isSelectedID;
  final bool isSelectedPassword;
  final bool isSelectedConfirmPassword;
  final bool isConfirmPasswordNull;
  final bool isConfirmPasswordMismatch;

  const FormValidatorState({
    this.isErrorID = false,
    this.isErrorPassword = false,
    this.ID = '',
    this.password = '',
    this.obscureText = true,
    this.isSelectedID = false,
    this.isSelectedPassword = false,
    this.isSelectedConfirmPassword = false,
    this.isConfirmPasswordNull = false,
    this.isConfirmPasswordMismatch = false,
  });
  bool isError();

  FormValidatorState copyWith({
    String? ID,
    String? password,
    bool? obscureText,
    bool? isErrorID,
    bool? isErrorPassword,
    bool? isSelectedID,
    bool? isSelectedPassword,
    bool? isSelectedConfirmPassword,
    bool? isConfirmPasswordNull,
    bool? isConfirmPasswordMismatch,
  });
}

class FormValidatorUpdate extends FormValidatorState {
  const FormValidatorUpdate({
    String ID = '',
    String password = '',
    bool obscureText = true,
    bool isErrorId = false,
    bool isErrorPassword = false,
    bool isSelectedID = false,
    bool isSelctedPassword = false,
    bool isSelectedConfirmPassword = false,
    bool isConfirmPasswordNull = false,
    bool isConfirmPasswordMismatch = false,
  }) : super(
            ID: ID,
            password: password,
            obscureText: obscureText,
            isErrorID: isErrorId,
            isErrorPassword: isErrorPassword,
            isSelectedID: isSelectedID,
            isSelectedPassword: isSelctedPassword,
            isSelectedConfirmPassword: isSelectedConfirmPassword,
            isConfirmPasswordNull: isConfirmPasswordNull,
            isConfirmPasswordMismatch: isConfirmPasswordMismatch);

  @override
  FormValidatorUpdate copyWith(
      {String? ID,
      String? password,
      bool? obscureText,
      bool? isErrorID,
      bool? isErrorPassword,
      bool? isSelectedID,
      bool? isSelectedPassword,
      bool? isSelectedConfirmPassword,
      bool? isConfirmPasswordNull,
      bool? isConfirmPasswordMismatch}) {
    return FormValidatorUpdate(
      ID: ID ?? this.ID,
      password: password ?? this.password,
      obscureText: obscureText ?? this.obscureText,
      isErrorId: isErrorID ?? this.isErrorID,
      isErrorPassword: isErrorPassword ?? this.isErrorPassword,
      isSelectedID: isSelectedID ?? this.isSelectedID,
      isSelctedPassword: isSelectedPassword ?? this.isSelectedPassword,
      isSelectedConfirmPassword:
          isSelectedConfirmPassword ?? this.isSelectedConfirmPassword,
      isConfirmPasswordNull:
          isConfirmPasswordNull ?? this.isConfirmPasswordNull,
      isConfirmPasswordMismatch:
          isConfirmPasswordMismatch ?? this.isConfirmPasswordMismatch,
    );
  }
  @override
  bool isError() {
    return isErrorID ||
        isErrorPassword ||
        isConfirmPasswordMismatch ||
        isConfirmPasswordNull;
  }
}
