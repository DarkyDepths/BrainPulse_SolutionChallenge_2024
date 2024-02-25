import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../Theme/font.dart';

Widget? showFlushbar(BuildContext context, errorMessage) {
  Flushbar(
    backgroundColor: Colors.red.shade700,
    duration: const Duration(seconds: 1),

    messageText: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        errorMessage,
        style: AppFonts.bold,
      ),
    ),
    // message: "Hellooooo",

    messageSize: 15,

    borderWidth: 1,

    maxWidth: MediaQuery.of(context).size.width * 0.89,
    borderRadius: const BorderRadius.all(Radius.circular(1234)),
    margin:
        const EdgeInsets.symmetric(vertical: kToolbarHeight, horizontal: 10),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(context);
  return null;
}
