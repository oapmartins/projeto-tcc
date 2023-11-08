import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_tcc/pages/login/login_controller.dart';
import 'package:projeto_tcc/pages/wave_custom_paint.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LoginController(),
        builder: (LoginController controller) {
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    color: Colors.green.shade200,
                  ),
                  CustomPaint(
                    painter: WaveCustomPaint(backgroundColor: Colors.green),
                    size: Size.infinite,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              'DietMax',
                              style: GoogleFonts.sairaStencilOne(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                shadows: [
                                  Shadow(
                                    // bottomLeft
                                    offset: const Offset(-1.5, -1.5),
                                    color: Colors.green.shade400,
                                  ),
                                  Shadow(
                                    // bottomRight
                                    offset: const Offset(1.5, -1.5),
                                    color: Colors.green.shade400,
                                  ),
                                  Shadow(
                                    // topRight
                                    offset: const Offset(1.5, 1.5),
                                    color: Colors.green.shade400,
                                  ),
                                  Shadow(
                                    // topLeft
                                    offset: const Offset(-1.5, 1.5),
                                    color: Colors.green.shade400,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/logo.png',
                              height: 150,
                              width: 150,
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              height: 60,
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                                decoration: InputDecoration(
                                  hintText: 'E-mail',
                                  hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: const Icon(Icons.email, size: 20),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            SizedBox(
                              height: 60,
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Senha',
                                  hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: const Icon(Icons.remove_red_eye, size: 20),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            SizedBox(
                              height: 60,
                              width: Get.size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed('/allergy');
                                },
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                ),
                                child: Text(
                                  'Entrar',
                                  style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/register');
                              },
                              child: const Text(
                                'Não tem conta? Cadastre-se!',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
