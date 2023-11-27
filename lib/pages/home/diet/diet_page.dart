// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/pages/home/diet/diet_controller.dart';
import 'package:projeto_tcc/util/util_status_server.dart';

class DietPage extends StatefulWidget {
  const DietPage({super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DietController>(builder: (DietController controller) {
      if (controller.loadingDiet == UtilServiceStatus.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.loadingDiet == UtilServiceStatus.error) {
        return const Center(child: Text('Erro ao realizar consulta da dieta!'));
      }

      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Dieta'),
          ),
          // floatingActionButton: FloatingActionButton.extended(
          //   label: Text('Salvar', style: TextStyle(color: Colors.white, fontSize: 20)),
          //   onPressed: () {},
          //   icon: Icon(FontAwesomeIcons.floppyDisk, color: Colors.white),
          //   backgroundColor: Colors.blue,
          // ),
          // floatingActionButton: FloatingActionButton.extended(
          //   label: Text('Simular valores', style: TextStyle(color: Colors.white, fontSize: 20)),
          //   onPressed: () {},
          //   icon: Icon(FontAwesomeIcons.moneyBill, color: Colors.white),
          //   backgroundColor: Colors.green.shade800,
          // ),
          floatingActionButton: SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.close,
            spacing: 3,
            childPadding: const EdgeInsets.all(5),
            spaceBetweenChildren: 4,
            buttonSize: Size(60, 60),
            iconTheme: IconThemeData(size: 25),
            overlayColor: Colors.black,
            overlayOpacity: 0.3,
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue.shade700,
            elevation: 8.0,
            animationCurve: Curves.elasticInOut,
            isOpenOnStart: false,
            childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            children: [
              SpeedDialChild(
                child: Icon(FontAwesomeIcons.plus),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                label: 'Adicionar refeição',
                onTap: controller.addRefeicao,
              ),
              SpeedDialChild(
                child: const Icon(FontAwesomeIcons.dollarSign),
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                label: 'Simular valores',
                onTap: () => debugPrint('SECOND CHILD'),
              ),
            ],
          ),
          body: GetBuilder<DietController>(
            init: DietController(),
            builder: (controller) {
              return ListView.builder(
                itemCount: controller.userDiet.length,
                itemBuilder: (BuildContext context, int index) {
                  return DietComponentWidget(
                    id: controller.userDiet[index]['ref_id'],
                    position: controller.userDiet[index]['position'],
                    title: controller.userDiet[index]['nome'],
                    time: controller.userDiet[index]['time'],
                    alimentos: controller.userDiet[index]['alimentos'],
                    controller: controller,
                  );
                },
                padding: const EdgeInsets.all(16),
              );
            },
          ),
        ),
      );
    });
  }
}

class DietComponentWidget extends StatefulWidget {
  const DietComponentWidget({
    super.key,
    required this.id,
    required this.position,
    required this.title,
    required this.time,
    required this.controller,
    required this.alimentos,
  });

  final String id;
  final int position;
  final String title;
  final String time;
  final DietController controller;
  final List alimentos;

  @override
  State<DietComponentWidget> createState() => _DietComponentWidgetState();
}

class _DietComponentWidgetState extends State<DietComponentWidget> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.fromDateTime(DateTime.parse(widget.time));
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        final now = DateTime.now();
        final timeToString = DateTime(now.year, now.month, now.day, picked.hour, picked.minute).toString();
        widget.controller.updateTimeRefeicao(id: widget.id, time: timeToString);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          backgroundColor: Colors.white,
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
          collapsedBackgroundColor: Colors.white,
          collapsedIconColor: Colors.green,
          iconColor: Colors.green,
          title: Row(
            children: [
              GestureDetector(
                onTap: () => widget.controller.removeRefeicao(id: widget.id),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(
                      color: Colors.grey.shade500,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.trash, color: Colors.red.shade700, size: 20),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  _selectTime(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(
                      color: Colors.grey.shade500,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.clock,
                          size: 20,
                          color: Colors.grey.shade700,
                        ),
                        const SizedBox(width: 10),
                        Center(
                            child: Text(
                          _selectedTime.format(context),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade700,
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: Colors.grey.shade700,
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
                  children: widget.controller.userDiet[widget.position]['alimentos'].map<Widget>((alimentos) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(
                            color: Colors.grey.shade500,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(FontAwesomeIcons.trash, color: Colors.red.shade700, size: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(alimentos['quantidade']),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text(alimentos['nome']),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('${alimentos['porcao']} Kcal'),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(
                            color: Colors.grey.shade500,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            FontAwesomeIcons.rightLeft,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList()

                  // [
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [

                  //   ],
                  // ),
                  // const Divider(),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         GestureDetector(
                  //           onTap: () {},
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               color: Colors.grey.shade200,
                  //               border: Border.all(
                  //                 color: Colors.grey.shade500,
                  //               ),
                  //               borderRadius: const BorderRadius.all(
                  //                 Radius.circular(10),
                  //               ),
                  //             ),
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(8),
                  //               child: Icon(FontAwesomeIcons.trash, color: Colors.red.shade700, size: 20),
                  //             ),
                  //           ),
                  //         ),
                  //         Expanded(
                  //           child: Column(
                  //             children: const [
                  //               Text('2'),
                  //             ],
                  //           ),
                  //         ),
                  //         Expanded(
                  //           child: Column(
                  //             children: const [
                  //               Text('Pão'),
                  //             ],
                  //           ),
                  //         ),
                  //         Expanded(
                  //           child: Column(
                  //             children: const [
                  //               Text('30 Kcal'),
                  //             ],
                  //           ),
                  //         ),
                  //         GestureDetector(
                  //           onTap: () {},
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               color: Colors.grey.shade200,
                  //               border: Border.all(
                  //                 color: Colors.grey.shade500,
                  //               ),
                  //               borderRadius: const BorderRadius.all(
                  //                 Radius.circular(10),
                  //               ),
                  //             ),
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(8),
                  //               child: Icon(
                  //                 FontAwesomeIcons.rightLeft,
                  //                 color: Colors.blue,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // Divider(),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         GestureDetector(
                  //           onTap: () {},
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               color: Colors.grey.shade200,
                  //               border: Border.all(
                  //                 color: Colors.grey.shade500,
                  //               ),
                  //               borderRadius: const BorderRadius.all(
                  //                 Radius.circular(10),
                  //               ),
                  //             ),
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(8),
                  //               child: Icon(FontAwesomeIcons.trash, color: Colors.red.shade700, size: 20),
                  //             ),
                  //           ),
                  //         ),
                  //         Expanded(
                  //           child: Column(
                  //             children: const [
                  //               Text('1'),
                  //             ],
                  //           ),
                  //         ),
                  //         Expanded(
                  //           child: Column(
                  //             children: const [
                  //               Text('Café puro'),
                  //             ],
                  //           ),
                  //         ),
                  //         Expanded(
                  //           child: Column(
                  //             children: const [
                  //               Text('10 Kcal'),
                  //             ],
                  //           ),
                  //         ),
                  //         GestureDetector(
                  //           onTap: () {},
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               color: Colors.grey.shade200,
                  //               border: Border.all(
                  //                 color: Colors.grey.shade500,
                  //               ),
                  //               borderRadius: const BorderRadius.all(
                  //                 Radius.circular(10),
                  //               ),
                  //             ),
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(8),
                  //               child: Icon(
                  //                 FontAwesomeIcons.rightLeft,
                  //                 color: Colors.blue,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // Divider(color: Colors.black),
                  // SizedBox(
                  //   height: 50,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: const [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Column(
                  //             children: [
                  //               Text(
                  //                 'Total',
                  //                 style: TextStyle(fontWeight: FontWeight.w800),
                  //               ),
                  //             ],
                  //           ),
                  //           Column(
                  //             children: [
                  //               Text(
                  //                 '140 Kcal',
                  //                 style: TextStyle(fontWeight: FontWeight.w800),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // ],
                  ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(
              '/search-food',
              arguments: {'ref_id': widget.id},
            );
          },
          child: Container(
            width: Get.size.width,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border.all(
                color: Colors.green,
              ),
            ),
            child: const Center(
              child: Text(
                'Adicionar Alimentos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
