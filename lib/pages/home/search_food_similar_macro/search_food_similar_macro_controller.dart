import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:projeto_tcc/services/foods_service.dart';
import 'package:projeto_tcc/util/util_status_server.dart';

class SearchFoodSimilarMacroController extends GetxController {
  NumberFormat formatador = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  FoodsService foodService = Get.find<FoodsService>();
  TextEditingController searchBarController = TextEditingController();

  TextEditingController tamanhoPorcaoController = TextEditingController();
  TextEditingController qtdePorcaoController = TextEditingController();
  TextEditingController idRefeicaoController = TextEditingController();
  TextEditingController valorEstimadoController = TextEditingController();

  UtilServiceStatus loadingAllFoods = UtilServiceStatus.done;
  UtilServiceStatus loadingProductById = UtilServiceStatus.done;
  List listAllFoods = [];
  List listAllFoodsBkp = [];
  List listFilterSelected = [];

  String idRefSelected = '';
  Map selectedProduct = {};
  Map selectedPorcao = {};
  List listPorcoes = [];
  String valueDropDown = '';

  Map alimentoAnteriorTroca = {};
  int posicaoAlimentoAnteriorTroca = 0;

  Future<void> searchFoodsSimilarMacro({required String similarMacro}) async {
    listAllFoods.clear();
    loadingAllFoods = UtilServiceStatus.loading;
    await foodService.getSimilarMacro(similarMacro).then((value) {
      listAllFoods = value;
      listAllFoodsBkp = [...listAllFoods];
      loadingAllFoods = UtilServiceStatus.done;
    }).catchError((error) {
      loadingAllFoods = UtilServiceStatus.error;
    });

    update();
  }

  Future<void> getProductById({required String id}) async {
    loadingProductById = UtilServiceStatus.loading;
    await foodService.getProductById(id).then((value) {
      selectedProduct = value;

      listPorcoes.clear();
      for (var item in value['medidas'].entries) {
        listPorcoes.add(item);
      }
      selectPorcao(listPorcoes.first.key);
      valueDropDown = listPorcoes.first.key;
      loadingProductById = UtilServiceStatus.done;
    }).catchError((error) {
      loadingProductById = UtilServiceStatus.error;
    });
    update();
  }

  void selectPorcao(String idPorcao) {
    selectedPorcao = selectedProduct['medidas'][idPorcao];
    update();
  }

  void filterList(String text) {
    // Limpando a lista
    listAllFoods.clear();

    // Primeiro é preciso fazer a consulta do texto.
    if (searchBarController.text.isEmpty) {
      listAllFoods = [...listAllFoodsBkp];
    } else {
      listAllFoods = listAllFoodsBkp.where((element) {
        return element['nome'].toString().toLowerCase().contains(searchBarController.text.toLowerCase());
      }).toList();
    }

    // Caso nenhum filtro for selecionado, vamos apenas retornar.
    if (listFilterSelected.isEmpty || listFilterSelected.contains('Todos')) {
      update();
      return;
    }

    // Depois filtrar pelos filtros selecionaveis.
    var listaFiltrada = [];
    for (var filter in listFilterSelected) {
      var listaAllFoodsFiltrada = listAllFoods.where((element) {
        if (filter == 'pussui-preco') {
          return element['possui_valor'] != null;
        } else if (filter == 'nao-pussui-preco') {
          return element['possui_valor'] == null;
        }
        return element['categoria'].toString().toLowerCase().contains(filter.toLowerCase());
      }).toList();

      listaFiltrada = [...List.from(Set.from(listaFiltrada).union(Set.from(listaAllFoodsFiltrada)))];
    }

    listAllFoods = [...listaFiltrada];

    update();
  }

  void clearList() {
    searchBarController.clear();
    listAllFoods = [...listAllFoodsBkp];
    update();
  }

  void clickFilterSelect(List<String> listFilters) {
    listFilterSelected = listFilters;

    // Limpando a lista
    listAllFoods.clear();

    // Primeiro é preciso fazer a consulta do texto.
    if (searchBarController.text.isEmpty) {
      listAllFoods = [...listAllFoodsBkp];
    } else {
      listAllFoods = listAllFoodsBkp.where((element) {
        return element['nome'].toString().toLowerCase().contains(searchBarController.text.toLowerCase());
      }).toList();
    }

    // Caso nenhum filtro for selecionado, vamos apenas retornar.
    if (listFilters.isEmpty || listFilters.contains('Todos')) {
      update();
      return;
    }

    // Depois filtrar pelos filtros selecionaveis.
    var listaFiltrada = [];
    for (var filter in listFilters) {
      var listaAllFoodsFiltrada = listAllFoods.where((element) {
        if (filter == 'pussui-preco') {
          return element['possui_valor'] != null;
        } else if (filter == 'nao-pussui-preco') {
          return element['possui_valor'] == null;
        }
        return element['grupo'].toString().toLowerCase().contains(filter.toLowerCase());
      }).toList();

      listaFiltrada = [...List.from(Set.from(listaFiltrada).union(Set.from(listaAllFoodsFiltrada)))];
    }

    listAllFoods = [...listaFiltrada];

    update();
  }

  void clearVariables() {
    tamanhoPorcaoController.clear();
    qtdePorcaoController.clear();
    idRefeicaoController.clear();
    valorEstimadoController.clear();
    selectedProduct = {};
    selectedPorcao = {};
    listPorcoes = [];
    alimentoAnteriorTroca = {};
    posicaoAlimentoAnteriorTroca = 0;
  }

  void calculateMacroQtdePorcoes(int qtdePorcoes) {
    update();
  }
}
