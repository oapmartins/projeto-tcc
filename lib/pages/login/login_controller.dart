import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/widgets/snackbars_widget.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
          .then((value) {
        // salvar dados do usuário localmente.
        // https://pub.dev/packages/sembast
        Get.offAndToNamed('/home');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        SnackbarsWidget().alertSnackbar(
          title: 'Alerta!',
          text: 'O endereço de email não está válido!',
          context: Get.context!,
        );
      } else if (e.code == 'user-disabled') {
        SnackbarsWidget().alertSnackbar(
          title: 'Alerta!',
          text: 'O usuário está desabilitado!',
          context: Get.context!,
        );
      } else if (e.code == 'user-not-found') {
        SnackbarsWidget().alertSnackbar(
          title: 'Alerta!',
          text: 'O usuário não está registrado!',
          context: Get.context!,
        );
      } else if (e.code == 'wrong-password') {
        SnackbarsWidget().alertSnackbar(
          title: 'Alerta!',
          text: 'A senha do usuário está incorreta!',
          context: Get.context!,
        );
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        SnackbarsWidget().alertSnackbar(
          title: 'Alerta!',
          text: 'Os dados de login estão inválidos!',
          context: Get.context!,
        );
      } else if (e.code == 'too-many-requests') {
        SnackbarsWidget().alertSnackbar(
          title: 'Alerta!',
          text: 'Você foi bloquado por tentar fazer muitas requisições!',
          context: Get.context!,
        );
      }
    } catch (e) {
      SnackbarsWidget().errorSnackbar(
        title: 'Erro!',
        text: 'Erro ao realizar login $e',
        context: Get.context!,
      );
    }
  }
}
