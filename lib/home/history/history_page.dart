// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_tcc/home/history/widgets/history_card_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Histórico da dieta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HistoryCardWidget(textRefeicao: 'Café da manhã', dataRefeicao: '25/10/2023'),
            HistoryCardWidget(textRefeicao: 'Almoço', dataRefeicao: '23/10/2023'),
            HistoryCardWidget(textRefeicao: 'Jantar', dataRefeicao: '16/09/2023'),
            HistoryCardWidget(textRefeicao: 'Café da manhã', dataRefeicao: '03/08/2023'),
            HistoryCardWidget(textRefeicao: 'Café da manhã', dataRefeicao: '03/08/2023'),
            HistoryCardWidget(textRefeicao: 'Café da manhã', dataRefeicao: '03/08/2023'),
            HistoryCardWidget(textRefeicao: 'Café da manhã', dataRefeicao: '03/08/2023'),
          ],
        ),
      ),
    );
  }
}
