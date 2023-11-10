// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/home/diet/diet_controller.dart';

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
          automaticallyImplyLeading: false,
          title: const Text('Dieta'),
        ),
        floatingActionButton: SizedBox(
          width: 110,
          // height: 100,
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(FontAwesomeIcons.floppyDisk, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
        body: GetBuilder<DietController>(
          init: DietController(),
          builder: (controller) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Valor estimado de sua dieta',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'R\$ 653,00',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.blue,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                DietComponentWidget(title: 'Café da manhã'),
                DietComponentWidget(title: 'Almoço'),
                DietComponentWidget(title: 'Café da tarde'),
                DietComponentWidget(title: 'Jantar'),
                SizedBox(height: 50),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DietComponentWidget extends StatefulWidget {
  const DietComponentWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<DietComponentWidget> createState() => _DietComponentWidgetState();
}

class _DietComponentWidgetState extends State<DietComponentWidget> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
          collapsedBackgroundColor: Colors.green.shade50,
          collapsedIconColor: Colors.green,
          iconColor: Colors.green,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  _selectTime(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.green,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        const Icon(FontAwesomeIcons.clock, size: 20),
                        const SizedBox(width: 10),
                        Center(
                            child: Text(
                          _selectedTime.format(context),
                          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          children: [
            ListTile(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              title: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text('2 unidades'),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('Ovos'),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('100 Kcal'),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  FontAwesomeIcons.rightLeft,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text('2 fatias'),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('Pão'),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('30 Kcal'),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  FontAwesomeIcons.rightLeft,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text('1 copo'),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('Café puro'),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('10 Kcal'),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  FontAwesomeIcons.rightLeft,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.black),
                  SizedBox(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '140 Kcal',
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/search-food');
          },
          child: Container(
            width: Get.size.width,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border.all(
                color: Colors.green,
              ),
            ),
            child: const Center(
              child: Text('Adicionar Alimentos'),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
