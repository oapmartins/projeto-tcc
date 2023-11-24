import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/util/widgets/snackbars_widget.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String pathPhotoUser = '';

  void updateProfile({required User user}) async {
    if (passwordController.text.isNotEmpty && (passwordController.text != confirmPasswordController.text)) {
      return SnackbarsWidget().alertSnackbar(
        title: 'Alerta!',
        text: 'As senhas não coincidem!',
        context: Get.context!,
      );
    }

    if (nameController.text.isNotEmpty) {
      user.updateDisplayName(nameController.text);
    }
    if (passwordController.text.isNotEmpty) {
      user.updatePassword(passwordController.text).catchError((error) {
        if (error.code == 'weak-password') {
          return SnackbarsWidget().alertSnackbar(
            title: 'Senha fraca!',
            text: 'A senha deve ter pelo menos 6 caracteres!',
            context: Get.context!,
          );
        }
      });
    }
    if (pathPhotoUser.isNotEmpty) {
      final fileImage = File(pathPhotoUser);
      final urlImage = await uploadFile(fileImage);
      user.updatePhotoURL(urlImage);
    }
  }

  Future<String> uploadFile(File image) async {
    String downloadURL;
    String postId = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance.ref().child("images").child("post_$postId.jpg");
    await ref.putFile(image);
    downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAndToNamed('/login');
  }
}
