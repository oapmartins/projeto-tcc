import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/pages/allergy/allergy_controller.dart';

import '../../util/widgets/card_switch_widget.dart';

class AllergyPage extends StatelessWidget {
  const AllergyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Você tem alguma alergia? 😢'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          height: 60,
          width: Get.size.width * .93,
          // color: Colors.green,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed('/home');
            },
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              backgroundColor: MaterialStatePropertyAll(Colors.green.shade700),
              elevation: const MaterialStatePropertyAll(5),
            ),
            child: const Text(
              'Prosseguir',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        body: GetBuilder<AllergyController>(
          init: AllergyController(),
          builder: (controller) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.cow,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Derivados do leite',
                  colorShade: [
                    Colors.red.shade300,
                    Colors.red.shade900,
                  ],
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.egg,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Ovos',
                  colorShade: [
                    Colors.red.shade300,
                    Colors.red.shade900,
                  ],
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.shrimp,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Marisco',
                  colorShade: [
                    Colors.red.shade300,
                    Colors.red.shade900,
                  ],
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.fish,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Peixes',
                  colorShade: [
                    Colors.red.shade300,
                    Colors.red.shade900,
                  ],
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.wheatAwn,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Amendoim (leguminosa) e frutos secos',
                  colorShade: [
                    Colors.green.shade300,
                    Colors.green.shade900,
                  ],
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.seedling,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Soja',
                  colorShade: [
                    Colors.green.shade300,
                    Colors.green.shade900,
                  ],
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.breadSlice,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Glúten',
                  colorShade: [
                    Colors.green.shade300,
                    Colors.green.shade900,
                  ],
                ),
                const SizedBox(height: 80, width: 1)
              ],
            );
          },
        ),
      ),
    );
  }
}
