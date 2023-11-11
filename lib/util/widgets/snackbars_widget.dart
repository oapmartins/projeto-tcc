import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SnackbarsWidget {
  void errorSnackbar({
    required String title,
    required String text,
    required BuildContext context,
  }) async {
    await Flushbar(
      title: title,
      message: text,
      duration: const Duration(seconds: 3),
      icon: const Icon(FontAwesomeIcons.circleExclamation, color: Colors.white),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 25),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      backgroundColor: Colors.red.shade500,
      titleSize: 18,
      messageSize: 16,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  void alertSnackbar({
    required String title,
    required String text,
    required BuildContext context,
  }) async {
    await Flushbar(
      title: title,
      message: text,
      duration: const Duration(seconds: 3),
      icon: const Icon(FontAwesomeIcons.triangleExclamation, color: Colors.white),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 25),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      backgroundColor: Colors.orange.shade500,
      titleSize: 18,
      messageSize: 16,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  void successSnackbar({
    required String title,
    required String text,
    required BuildContext context,
  }) async {
    await Flushbar(
      title: title,
      message: text,
      duration: const Duration(seconds: 3),
      icon: const Icon(FontAwesomeIcons.circleCheck, color: Colors.white),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 25),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      backgroundColor: Colors.green.shade500,
      titleSize: 18,
      messageSize: 16,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
