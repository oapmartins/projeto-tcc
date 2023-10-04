import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/pages/goals/goals_controller.dart';
// ignore_for_file: prefer_const_constructors

class DietPage extends StatefulWidget {
  const DietPage({super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Selecione a sua dieta'),
        ),
        body: GetBuilder<GoalsController>(
          init: GoalsController(),
          builder: (controller) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Column(
                  children: [
                    ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      backgroundColor: Colors.green.shade50,
                      collapsedShape: const ContinuousRectangleBorder(
                        side: BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      shape: const ContinuousRectangleBorder(
                        side: BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      // backgroundColor: Colors.yellow,
                      collapsedBackgroundColor: Colors.grey.shade200,
                      collapsedIconColor: Colors.green,
                      iconColor: Colors.green,
                      title: const Row(
                        children: [
                          Icon(FontAwesomeIcons.breadSlice),
                          SizedBox(width: 15),
                          Text(
                            'Café da manhã',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      children: const [
                        ListTile(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('2 unidades'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Ovos'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('100 Kcal'),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('2 fatias'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Pão'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('30 Kcal'),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('1 copo'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Café puro'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('10 Kcal'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: Get.size.width,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        border: Border.all(
                          color: Colors.green,
                        ),
                      ),
                      child: Center(
                        child: Text('Adicionar Alimentos'),
                      ),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
