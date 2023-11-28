import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/services/diet_service.dart';
import 'package:projeto_tcc/util/util_status_server.dart';

class HistoryController extends GetxController {
  HistoryController() {
    getRefsHistory(id: FirebaseAuth.instance.currentUser?.uid ?? '');
  }

  DietService dietService = Get.find<DietService>();
  UtilServiceStatus loadingHistory = UtilServiceStatus.done;
  List listHistorico = [];

  Future<void> getRefsHistory({required String id}) async {
    loadingHistory = UtilServiceStatus.loading;
    await dietService.getRefsHistory(id).then((value) {
      listHistorico = value;
      loadingHistory = UtilServiceStatus.done;
    }).catchError((error) {
      loadingHistory = UtilServiceStatus.error;
    });
    update();
  }

  Future<void> showDialogAlimentos({required List listAlimentos}) async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Lista de alimentos'),
          content: Column(
              mainAxisSize: MainAxisSize.min,
              children: listAlimentos.asMap().entries.map<Widget>((alimentos) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(alimentos.value['quantidade']),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(alimentos.value['nome']),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Text('${alimentos.value['medidas']['valor energético (kcal)']} Kcal'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                );
              }).toList()),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
