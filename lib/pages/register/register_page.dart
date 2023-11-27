import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/pages/register/register_controller.dart';
import 'package:projeto_tcc/pages/wave_custom_paint.dart';
import 'package:projeto_tcc/util/metodos/validator_regex.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (RegisterController controller) {
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.name,
                            style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                              hintText: 'Nome',
                              hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: const Icon(Icons.person, size: 20),
                              errorStyle: const TextStyle(fontSize: 15),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            validator: (value) {
                              if (value == '') {
                                return 'Insira um nome válido!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            controller: controller.email,
                            style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                              hintText: 'E-mail',
                              hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: const Icon(Icons.email, size: 20),
                              errorStyle: const TextStyle(fontSize: 15),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            validator: (val) {
                              if (!ValidatorRegex.isValidEmail(val ?? '')) {
                                return 'Insira um email válido!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            controller: controller.password,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                            ),
                            obscureText: obscureTextPassword,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                              hintText: 'Senha',
                              hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  obscureTextPassword = !obscureTextPassword;
                                  setState(() {});
                                },
                                child: const Icon(Icons.remove_red_eye, size: 20),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              errorStyle: const TextStyle(fontSize: 15),
                              errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            validator: (val) {
                              if ((val ?? '').length < 6) {
                                return 'Insira uma senha válida!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                            ),
                            obscureText: obscureTextPassword,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                              hintText: 'Confirmar Senha',
                              hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  obscureTextPassword = !obscureTextPassword;
                                  setState(() {});
                                },
                                child: const Icon(Icons.remove_red_eye, size: 20),
                              ),
                              errorStyle: const TextStyle(fontSize: 15),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            validator: (value) {
                              if (controller.password.text != '' && value != controller.password.text) {
                                return 'As senhas não correspondem!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            height: 60,
                            width: Get.size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.registerAccount();
                                }
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
              ),
            ],
          ),
        ),
      );
    });
  }
}
