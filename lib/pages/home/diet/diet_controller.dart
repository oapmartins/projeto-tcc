import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/services/diet_service.dart';
import 'package:projeto_tcc/util/util_status_server.dart';
import 'package:projeto_tcc/util/widgets/snackbars_widget.dart';
import 'package:uuid/uuid.dart';

class DietController extends GetxController {
  DietService dietService = Get.find<DietService>();
  UtilServiceStatus loadingDiet = UtilServiceStatus.done;
  UtilServiceStatus loadingInsertDiet = UtilServiceStatus.done;
  List userDiet = [];

  Future<void> getUserDiet({required String id}) async {
    loadingDiet = UtilServiceStatus.loading;
    await dietService.getUserDiet(id).then((value) {
      userDiet = value;
      loadingDiet = UtilServiceStatus.done;
    }).catchError((error) {
      loadingDiet = UtilServiceStatus.error;
    });
    update();
  }

  Future<void> addUserDiet() async {
    // Reatribuindo o valor da ordenação a cada inserção.
    userDiet.toList().asMap().forEach((index, diet) {
      diet['nome'] = 'Refeição $index';
      diet['position'] = index;
    });

    loadingInsertDiet = UtilServiceStatus.loading;
    await dietService
        .insertDiet(FirebaseAuth.instance.currentUser?.uid ?? '', jsonEncode(userDiet))
        .then((value) {
      loadingInsertDiet = UtilServiceStatus.done;
      SnackbarsWidget().successSnackbar(
        title: 'Sucesso!',
        text: 'Sua dieta foi atualizada com sucesso!',
        context: Get.context!,
      );
    }).catchError((error) {
      SnackbarsWidget().successSnackbar(
        title: 'Erro!',
        text: 'Erro ao atualizar dieta!',
        context: Get.context!,
      );
      loadingInsertDiet = UtilServiceStatus.error;
    });
    update();
  }

  void addRefeicao() {
    var uuid = const Uuid();

    // Reatribuindo o valor da ordenação a cada inserção.
    userDiet.toList().asMap().forEach((index, diet) {
      diet['nome'] = 'Refeição $index';
      diet['position'] = index;
    });

    userDiet.add({
      'ref_id': uuid.v1(),
      'nome': 'Refeição ${userDiet.length.toString()}',
      'position': userDiet.length,
      'alimentos': [],
      'time': '2023-11-26 00:00:00.000',
      'atualizado': true,
    });
    update();
  }

  void addFoodRefeicao({required String id, required Map food}) {
    userDiet.toList().asMap().forEach((index, diet) {
      if (diet['ref_id'] == id) {
        diet['atualizado'] = true;
        diet['alimentos'].add(food);
      }
    });
    update();
  }

  void updateTimeRefeicao({required String id, required String time}) {
    userDiet.toList().asMap().forEach((index, diet) {
      if (diet['ref_id'] == id) {
        diet['time'] = time;
      }
    });
    update();
  }

  void removeRefeicao({required String id}) {
    userDiet.removeWhere((refeicao) => refeicao['ref_id'] == id);

    // Reatribuindo o valor da ordenação a cada exclusão.
    userDiet.toList().asMap().forEach((index, diet) {
      diet['nome'] = 'Refeição $index';
      diet['position'] = index;
    });
    update();
  }

  Future<void> dialogDeleteRef({required String id}) async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alerta'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Você deseja remover a refeição?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Sim'),
              onPressed: () {
                removeRefeicao(id: id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void removeAlimento({required int positionRef, required int positionAlimento}) {
    userDiet[positionRef]['alimentos'].removeAt(positionAlimento);
    userDiet[positionRef]['atualizado'] = true;
    update();
  }

  Future<void> dialogDeleteAlimento({required int positionRef, required int positionAlimento}) async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alerta'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Você deseja remover o alimento?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Sim'),
              onPressed: () {
                removeAlimento(positionRef: positionRef, positionAlimento: positionAlimento);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
