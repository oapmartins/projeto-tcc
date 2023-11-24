import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_tcc/pages/home/profile/profile_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  XFile? _imagePath;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (ProfileController controller) {
          controller.nameController.text = user?.displayName ?? '';
          controller.emailController.text = user?.email ?? '';

          if (controller.pathPhotoUser.isEmpty) {
            controller.pathPhotoUser = user?.photoURL ?? '';
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Meu Perfil'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 52,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: _imagePath?.path != null && _imagePath?.path != ''
                                ? FileImage(File((_imagePath?.path ?? '')))
                                : NetworkImage(user?.photoURL ?? '') as ImageProvider,
                            child: IconButton(
                              icon: const Icon(Icons.edit, size: 30, color: Colors.white),
                              onPressed: () {
                                _pickImage(controller: controller);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(labelText: 'Nome'),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: controller.emailController,
                      enableInteractiveSelection: false,
                      enabled: false,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      readOnly: true,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: controller.passwordController,
                      decoration: const InputDecoration(labelText: 'Senha'),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: controller.confirmPasswordController,
                      decoration: const InputDecoration(labelText: 'Confirmar Senha'),
                    ),
                    const SizedBox(height: 40.0),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.updateProfile(user: user!);
                        },
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Atualizar Perfil',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Icon(FontAwesomeIcons.penToSquare, color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.logout();
                        },
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(Colors.red),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Deslogar',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Icon(FontAwesomeIcons.rightFromBracket, color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> _pickImage({required ProfileController controller}) async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imagePath = image;
      });
      controller.pathPhotoUser = image.path;
    }
  }
}
