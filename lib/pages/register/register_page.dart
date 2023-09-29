import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_tcc/pages/register/register_controller.dart';
import 'package:projeto_tcc/pages/wave_custom_paint.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: RegisterController(),
        builder: (RegisterController controller) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Cadastro'),
              ),
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
                            SizedBox(
                              height: 60,
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                                decoration: InputDecoration(
                                  hintText: 'Nome',
                                  hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: const Icon(Icons.person, size: 20),
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
                            const SizedBox(height: 25),
                            SizedBox(
                              height: 60,
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Confirmar Senha',
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
                                onPressed: () {},
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                ),
                                child: Text(
                                  'Cadastrar',
                                  style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                                ),
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
