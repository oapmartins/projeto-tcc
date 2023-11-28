// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/pages/home/history/history_controller.dart';
import 'package:projeto_tcc/pages/home/history/widgets/history_card_widget.dart';
import 'package:projeto_tcc/util/util_status_server.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HistoryController(),
        builder: (HistoryController controller) {
          if (controller.loadingHistory == UtilServiceStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.loadingHistory == UtilServiceStatus.error) {
            return const Center(child: Text('Erro ao realizar consulta do histórico!'));
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Histórico'),
            ),
            body: ListView.builder(
              itemCount: controller.listHistorico.length,
              itemBuilder: (BuildContext context, int index) {
                return HistoryCardWidget(
                  textRefeicao: controller.listHistorico[index]['nome'],
                  dataRefeicao: controller.listHistorico[index]['data_criacao'],
                  onTapVisualizar: () {
                    controller.showDialogAlimentos(
                        listAlimentos: controller.listHistorico[index]['alimentos']);
                  },
                  onTapVoltarRefeicao: () {
                    print(controller.listHistorico[index]['ref_id']);
                  },
                );
              },
            ),
          );
        });
  }
}
