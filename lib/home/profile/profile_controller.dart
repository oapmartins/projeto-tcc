import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String pathPhotoUser = '';

  void updateProfile({required User user}) {
    try {
      if (nameController.text.isNotEmpty) {
        user.updateDisplayName(nameController.text);
      }
      if (emailController.text.isNotEmpty) {
        user.updateEmail(emailController.text);
      }
      if (passwordController.text.isNotEmpty) {
        user.updatePassword(passwordController.text);
      }
      if (pathPhotoUser.isNotEmpty) {
        user.updatePhotoURL(pathPhotoUser);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAndToNamed('/login');
  }
}
