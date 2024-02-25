import 'package:brain_pulse/Features/Authentication/cubit/form_validator_cubit.dart';
import 'package:brain_pulse/Features/Authentication/pages/signup_page.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

class IDCredentialInput extends StatelessWidget {
  const IDCredentialInput(
      {super.key,
      required GlobalKey<FormFieldState<String>> credentialKey,
      required this.controller,
      required this.focusNodes})
      : _credentialKey = credentialKey;

  final GlobalKey<FormFieldState<String>> _credentialKey;

  final TextEditingController controller;
  final List<FocusNode> focusNodes;

  @override
  Widget build(BuildContext context) {
    final formCubit = context.read<FormValidatorCubit>();
    return Input(
      textInputAction: TextInputAction.next,
      focuseNode: focusNodes[0],
      onFieldSubmitted: (p0) {
        FocusOnNextField(context, focusNodes[0], focusNodes[1]);
      },
      controller: controller,
      inputKey: _credentialKey,
      isSelcted: formCubit.state.isSelectedID,
      isError: formCubit.state.isErrorID,
      labelText: 'ID Credential',
      hintText: 'Bosch\$\$Intern123DFA',
      error: Text.rich(
        TextSpan(children: [
          TextSpan(
              text: "Invalid ID! Please Try Again or Contact ",
              style: AppFonts.bold
                  .copyWith(color: AppColors.orange, fontSize: 11)),
          TextSpan(
              text: "Support For Assistance",
              style: AppFonts.bold.copyWith(fontSize: 11))
        ]),
      ),
      onFocusChange: (value) {
        formCubit.toggleIsSelectedID();
        if (!value) if (_credentialKey.currentState!.validate()) {
          formCubit.updateID(controller.text);
          print("Text is valid");
        } else {
          print('text mahouwech');
          // formCubit.toggleIsErrorID(true);
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty ||value.length<5) {
          formCubit.toggleIsErrorID(true);
        } else {
          formCubit.toggleIsErrorID(false);
        }
        return null;
      },
      prefixIcon: "assets/images/email.png",
      suffixIcon: Image.asset("assets/images/down.png"),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput(
      {super.key,
      required GlobalKey<FormFieldState<String>> passKey,
      required this.label,
      required this.controller,
      this.onFieldSubmitted,
      required this.focusNodes})
      : _passKey = passKey;

  final GlobalKey<FormFieldState<String>> _passKey;
  final Function(String?)? onFieldSubmitted;
  final TextEditingController controller;
  final String label;
  final List<FocusNode> focusNodes;

  @override
  Widget build(BuildContext context) {
    final formCubit = context.read<FormValidatorCubit>();

    return Input(
      textInputAction:
          focusNodes.length == 3 ? TextInputAction.next : TextInputAction.done,
      focuseNode: focusNodes[1],
      onFieldSubmitted: focusNodes.length == 3
          ? (p0) {
              FocusOnNextField(context, focusNodes[1], focusNodes[2]);
            }
          : null,
      controller: controller,
      obscureText: formCubit.state.obscureText,
      inputKey: _passKey,
      isSelcted: formCubit.state.isSelectedPassword,
      isError: formCubit.state.isErrorPassword,
      labelText: label,
      hintText: "Enter your password..",
      error: Text(
        "Please enter a valid password",
        textAlign: TextAlign.start,
        style: AppFonts.bold.copyWith(color: AppColors.orange, fontSize: 11),
      ),
      onFocusChange: (value) {
        formCubit.toggleIsSelectedPassword();
        if (!value) {
          if (_passKey.currentState!.validate()) {
            formCubit.updatePassword(controller.text);
            print("Text is valid");
          } else {
            print('text mahouwech');
            // formCubit.toggleIsErrorID(true);
          }
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty||value.length<6) {
          formCubit.toggleIsErrorPassword(true);
        } else {
          formCubit.toggleIsErrorPassword(false);
        }
        return null;
      },
      prefixIcon: "assets/images/lock_icon.png",
      suffixIcon: GestureDetector(
        onTap: () {
          formCubit.toggleObscureText();
        },
        child: Image.asset("assets/images/eye.png",
            color: formCubit.state.obscureText ? null : Colors.white),
      ),
    );
  }
}

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput(
      {super.key,
      required GlobalKey<FormFieldState<String>> confirmPassKey,
      required this.label,
      required this.controller,
      required this.focusNodes})
      : _confirmPassKey = confirmPassKey;

  final GlobalKey<FormFieldState<String>> _confirmPassKey;
  final List<FocusNode> focusNodes;

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    final formCubit = context.read<FormValidatorCubit>();
    return Input(
      textInputAction: TextInputAction.done,
      focuseNode: focusNodes[2],
      controller: controller,
      obscureText: formCubit.state.obscureText,
      inputKey: _confirmPassKey,
      isSelcted: formCubit.state.isSelectedConfirmPassword,
      isError: formCubit.state.isConfirmPasswordMismatch ||
          formCubit.state.isConfirmPasswordNull,
      labelText: label,
      hintText: "Enter your password..",
      error: Text(
        formCubit.state.isConfirmPasswordMismatch
            ? "Password mismatch"
            : "Please enter a valid password",
        textAlign: TextAlign.start,
        style: AppFonts.bold.copyWith(color: AppColors.orange, fontSize: 11),
      ),
      onFocusChange: (value) {
        formCubit.toggleIsSelectedConfirmPassword();
        print(
            "isSelected fel confirm password ? ${formCubit.state.isSelectedConfirmPassword}");
        if (!value) {
          if (_confirmPassKey.currentState!.validate()) {
            print("Text is valid");
          } else {
            print('text mahouwech');
            // formCubit.toggleIsErrorID(true);
          }
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          formCubit.toggleIsConfirmPasswordNull(true);
        } else if (value != formCubit.state.password) {
          formCubit.toggleIsConfirmPasswordMismatch(true);
        } else {
          formCubit.toggleIsConfirmPasswordMismatch(false);
          formCubit.toggleIsConfirmPasswordNull(false);
        }
        return null;
      },
      prefixIcon: "assets/images/lock_icon.png",
      suffixIcon: GestureDetector(
        onTap: () {
          formCubit.toggleObscureText();
        },
        child: Image.asset("assets/images/eye.png",
            color: formCubit.state.obscureText ? null : Colors.white),
      ),
    );
  }
}

class Input extends StatelessWidget {
  final String prefixIcon;
  final Widget suffixIcon;
  final String labelText;
  final String hintText;
  final Widget error;
  final bool isError;
  final bool isSelcted;
  final bool obscureText;
  final Function(bool) onFocusChange;
  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState> inputKey;
  final TextEditingController controller;
  final FocusNode focuseNode;
  final Function(String)? onFieldSubmitted;
  final TextInputAction textInputAction;
  const Input({
    super.key,
    required this.labelText,
    required this.error,
    required this.isError,
    required this.isSelcted,
    required this.onFocusChange,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.inputKey,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    required this.focuseNode,
    this.onFieldSubmitted,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: AppFonts.mainButtonsFont.copyWith(fontSize: 14),
          ),
          const Gap(5),
          DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1234),
                boxShadow: isError
                    ? [
                        BoxShadow(
                            color: AppColors.orange.withOpacity(0.3),
                            offset: Offset.zero,
                            blurRadius: 0,
                            spreadRadius: 4)
                      ]
                    : isSelcted
                        ? [
                            BoxShadow(
                                color: AppColors.green.withOpacity(0.3),
                                offset: Offset.zero,
                                blurRadius: 0,
                                spreadRadius: 4)
                          ]
                        : null),
            child: Focus(
              onFocusChange: onFocusChange,
              child: Column(
                children: [
                  TextFormField(
                      focusNode: focuseNode,
                      onChanged: (value) {
                        print(controller.text);
                      },
                      controller: controller,
                      textInputAction: textInputAction,
                      onFieldSubmitted: onFieldSubmitted,
                      obscureText: obscureText,
                      obscuringCharacter: '*',
                      clipBehavior: Clip.antiAlias,
                      key: inputKey,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: AppFonts.bold
                            .copyWith(color: AppColors.lightGrey, fontSize: 16),
                        contentPadding: const EdgeInsets.all(20),
                        prefixIcon: Image.asset(prefixIcon),
                        suffixIcon: suffixIcon,
                        filled: true,
                        fillColor: AppColors.marronSecondary2,
                        border: InputBorder.none,
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(1234)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(1234)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: isError
                                    ? AppColors.orange
                                    : AppColors.green),
                            borderRadius: BorderRadius.circular(1234)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.orange),
                            borderRadius: BorderRadius.circular(1234)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.orange),
                            borderRadius: BorderRadius.circular(1234)),
                      ),
                      style: AppFonts.bold.copyWith(fontSize: 16),
                      validator: validator),
                ],
              ),
            ),
          ),
          const Gap(13),
          isError
              ? Container(
                  width: 100.w,
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xff432500),
                    borderRadius: BorderRadius.circular(1234),
                    border: Border.all(color: AppColors.orange),
                  ),
                  child: error)
              : Container(),
        ],
      ),
    );
  }
}

void FocusOnNextField(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
