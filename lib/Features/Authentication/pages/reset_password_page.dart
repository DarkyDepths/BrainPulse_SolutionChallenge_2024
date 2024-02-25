// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brain_pulse/Features/Authentication/cubit/forgot_pass_metho.dart';
import 'package:brain_pulse/Global/main_button.dart';
import 'package:brain_pulse/Global/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:brain_pulse/Global/my_appbar.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:sizer/sizer.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_ResetPasswordMethod> methods = [
      _ResetPasswordMethod(
          name: "Use 2FA", imagePath: "assets/images/supergo_lock.png"),
      _ResetPasswordMethod(
          name: "Password", imagePath: "assets/images/supergo_pass.png"),
      _ResetPasswordMethod(
          name: "Google Authenticator",
          imagePath: "assets/images/supergo_google_auth.png"),
    ];
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: _ResetPasswordUI(methods: methods),
    );
  }
}

class _ResetPasswordUI extends StatelessWidget {
  const _ResetPasswordUI({
    super.key,
    required this.methods,
  });

  final List<_ResetPasswordMethod> methods;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.marron,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyAppBar(
                  title: "",
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
              Text(
                "Forgot Password",
                style: AppFonts.headLine,
              ),
              Text(
                "Select contact details where you want to\nreset your passwrod.",
                style: AppFonts.medium
                    .copyWith(fontSize: 16, color: AppColors.lightGrey),
              ),
              BlocBuilder<ForgotPasswordCubit, int?>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < methods.length; i++)
                        _ResetPasswordMethodWidget(
                          method: methods[i],
                          isSelected: i == state,
                          onTap: () {
                            context.read<ForgotPasswordCubit>().selectMethod(i);
                          },
                        ),
                    ],
                  );
                },
              ),
              MainButton(
                  color: AppColors.marronSecondary,
                  text: "Send Password",
                  iconPath: "assets/images/lock_icon.png",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Popup(
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/sent_code.png",width: 100.w,scale: 0.9,),
                            Text(
                              "We've Sent Verification\nCode to ****_***_***24",
                              style: AppFonts.headLine.copyWith(fontSize: 24),
                            ),
                            Text(
                              "Didn’t receive the link? Then re-send\nthe password below! 🔑",
                              style: AppFonts.medium
                                  .copyWith(color: AppColors.lightGrey),
                            ),
                            MainButton(
                                color: AppColors.marronSecondary,
                                text: "Re-Send Password",
                                iconPath: "assets/images/lock_icon.png",
                                onPressed: () {
                                  Navigator.of(context).pop();
                                })
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class _ResetPasswordMethod {
  final String name;
  final String imagePath;
  _ResetPasswordMethod({
    required this.name,
    required this.imagePath,
  });
}

class _ResetPasswordMethodWidget extends StatelessWidget {
  final _ResetPasswordMethod method;
  final bool isSelected;
  final Function() onTap;
  const _ResetPasswordMethodWidget(
      {super.key,
      required this.method,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 116,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1234),
              color: AppColors.marronSecondary2,
              border: isSelected ? Border.all(color: AppColors.green) : null,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                          offset: Offset.zero,
                          spreadRadius: 4,
                          blurRadius: 0,
                          color: AppColors.green.withOpacity(0.3))
                    ]
                  : null),
          child: Row(
            children: [
              Image.asset(method.imagePath),
              const Gap(20),
              Text(
                method.name,
                style: AppFonts.bold.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
