import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/pages/goals/goals_controller.dart';

import '../../util/widgets/card_switch_widget.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Defina seus objetivos 🏆'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          height: 60,
          width: Get.size.width * .93,
          // color: Colors.green,
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
        body: GetBuilder<GoalsController>(
          init: GoalsController(),
          builder: (controller) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Comidas:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.egg,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Consumir mais ovos',
                  colorShade: [
                    Colors.red.shade300,
                    Colors.red.shade900,
                  ],
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.bacon,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Consumir mais carne vermelha',
                  colorShade: [
                    Colors.red.shade300,
                    Colors.red.shade900,
                  ],
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.drumstickBite,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Consumir mais frango',
                  colorShade: [
                    Colors.red.shade300,
                    Colors.red.shade900,
                  ],
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.appleWhole,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Consumir mais frutas',
                  colorShade: [
                    Colors.green.shade300,
                    Colors.green.shade900,
                  ],
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.leaf,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Consumir mais salada',
                  colorShade: [
                    Colors.green.shade300,
                    Colors.green.shade900,
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    'Bebidas:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.bottleWater,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Consumir mais água',
                  colorShade: [
                    Colors.blue.shade300,
                    Colors.blue.shade900,
                  ],
                ),
                CardSwitchWidget(
                  icon: const Icon(
                    FontAwesomeIcons.cow,
                    color: Colors.white,
                    size: 40,
                  ),
                  text: 'Consumir mais leite',
                  colorShade: [
                    Colors.blue.shade300,
                    Colors.blue.shade900,
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
