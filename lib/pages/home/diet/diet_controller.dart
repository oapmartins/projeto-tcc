import 'package:get/get.dart';
import 'package:projeto_tcc/services/diet_service.dart';
import 'package:projeto_tcc/util/util_status_server.dart';

class DietController extends GetxController {
  DietService dietService = Get.find<DietService>();
  UtilServiceStatus loadingDiet = UtilServiceStatus.done;
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

  void addRefeicao() {
    // Reatribuindo o valor da ordenação a cada inserção.
    userDiet.toList().asMap().forEach((index, diet) {
      diet['ref_id'] = 'ref_id_$index';
      diet['nome'] = 'Refeição $index';
      diet['position'] = index;
    });

    userDiet.add({
      'ref_id': 'ref_id_${userDiet.length.toString()}',
      'nome': 'Refeição ${userDiet.length.toString()}',
      'position': userDiet.length,
      'alimentos': [],
      'time': '2023-11-26 00:00:00.000',
    });
    update();
  }

  void addFoodRefeicao({required String id, required Map food}) {
    userDiet.toList().asMap().forEach((index, diet) {
      if (diet['ref_id'] == id) {
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
      diet['ref_id'] = 'ref_id_$index';
      diet['nome'] = 'Refeição $index';
      diet['position'] = index;
    });
    update();
  }
}
