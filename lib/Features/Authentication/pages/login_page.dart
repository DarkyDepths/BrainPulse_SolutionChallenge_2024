import 'package:another_flushbar/flushbar.dart';

import 'package:brain_pulse/Features/Authentication/bloc/auth_bloc.dart';
import 'package:brain_pulse/Features/Authentication/cubit/form_validator_cubit.dart';
import 'package:brain_pulse/Features/Authentication/pages/reset_password_page.dart';
import 'package:brain_pulse/Features/Authentication/pages/signup_page.dart';
import 'package:brain_pulse/Features/Authentication/utils/auth_template.dart';
import 'package:brain_pulse/Features/ChatBot/pages/new_conversation.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/menta_health_assessement.dart';
import 'package:brain_pulse/Global/main_button.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:brain_pulse/Transition/slide_transition.dart';
import 'package:brain_pulse/Utils/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../utils/input.dart';

class AuthenticationCheck extends StatelessWidget {
  const AuthenticationCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print(state);
          if (state is AuthenticatedState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const MentalHealthAssessement()),
            );
          } else if (state is UnauthenticatedState) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const AuthenticationCheck()),
              (route) => false,
            );
          } else if (state is AuthFailureState) {
            showFlushbar(context, state.errorMessage);
          }
        },
        child: const LoginPage());
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormValidatorCubit(),
      child: const _LoginPageUI(),
    );
  }
}

class _LoginPageUI extends StatefulWidget {
  const _LoginPageUI({super.key});

  @override
  State<_LoginPageUI> createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<_LoginPageUI> {
  late GlobalKey<FormFieldState<String>> _credentialKey;
  late GlobalKey<FormFieldState<String>> _passKey;
  late GlobalKey<FormFieldState<String>> _loginFormKey;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void initState() {
    _credentialKey = GlobalKey();
    _passKey = GlobalKey();
    _loginFormKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<FocusNode> loginFocusNodes = [
      FocusNode(),
      FocusNode(),
    ];
    return Stack(
      children: [
        AuthTemplate(
            title: "Sign In",
            form: Column(
              children: [
                //Form
                BlocBuilder<FormValidatorCubit, FormValidatorState>(
                  builder: (context, state) {
                    return Form(
                      key: _loginFormKey,
                      child: SizedBox(
                        width: 93.w,
                        child: Column(
                          children: [
                            IDCredentialInput(
                                focusNodes: loginFocusNodes,
                                credentialKey: _credentialKey,
                                controller: _idController),
                            const Gap(15),
                            PasswordInput(
                                focusNodes: loginFocusNodes,
                                label: "Password",
                                passKey: _passKey,
                                controller: _passController),
                            const Gap(20),
                            MainButton(
                                color: AppColors.marronSecondary,
                                text: "Sign In",
                                iconPath: "assets/images/arrow_forword.png",
                                onPressed: () {
                                  _loginFormKey.currentState?.validate();
                                  if (!state.isError()) {
                                    context.read<AuthBloc>().add(SignInUser(
                                        _idController.text.trim(),
                                        _passController.text.trim()));
                                  }
                                }),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(SlidingPageRoute(child: const SignUp()));
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Don’t have an account? ',
                            style: AppFonts.bold.copyWith(fontSize: 14)),
                        TextSpan(
                          text: 'Sign Up',
                          style: AppFonts.bold.copyWith(
                              fontSize: 14,
                              color: AppColors.orange,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.orange,
                              decorationThickness: 3),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(10),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(SlidingPageRoute(child: const ResetPassword()));
                  },
                  child: Text(
                    "Forgot Password",
                    style: AppFonts.bold.copyWith(
                        decorationColor: AppColors.orange,
                        decorationThickness: 3,
                        fontSize: 14,
                        color: AppColors.orange,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            )),
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state is AuthLoadingState
                ? const Center(
                  child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                )
                : Container();
          },
        )
      ],
    );
  }
}
