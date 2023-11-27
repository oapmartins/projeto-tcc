import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/services/auth_service.dart';
import 'package:projeto_tcc/util/widgets/snackbars_widget.dart';

class RegisterController extends GetxController {
  AuthService authService = Get.find<AuthService>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> registerAccount() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      )
          .then((value) async {
        await value.user?.updateDisplayName(name.text);
        await authService.setUser(value.user?.uid ?? '', {
          'name': name.text,
          'email': email.text,
        }).then((value) {
          Get.offAndToNamed('/allergy');
          SnackbarsWidget().successSnackbar(
            title: 'Sucesso!',
            text: 'O usuário foi registrado com sucesso!',
            context: Get.context!,
          );
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackbarsWidget().alertSnackbar(
          title: 'Alerta!',
          text: 'A senha está muito fraca!',
          context: Get.context!,
        );
      } else if (e.code == 'email-already-in-use') {
        SnackbarsWidget().alertSnackbar(
          title: 'Alerta!',
          text: 'Email já registrado!',
          context: Get.context!,
        );
      }
    } catch (e) {
      SnackbarsWidget().errorSnackbar(
        title: 'Erro!',
        text: 'Erro ao criar conta $e',
        context: Get.context!,
      );
    }
  }
}
