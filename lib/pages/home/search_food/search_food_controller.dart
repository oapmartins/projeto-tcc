import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/services/foods_service.dart';
import 'package:projeto_tcc/util/util_status_server.dart';

class SearchFoodController extends GetxController {
  SearchFoodController() {
    searchAllFoods();
  }

  FoodsService foodService = Get.find<FoodsService>();
  TextEditingController searchBarController = TextEditingController();
  TextEditingController qtdePorcaoController = TextEditingController();
  UtilServiceStatus loadingAllFoods = UtilServiceStatus.done;
  UtilServiceStatus loadingProductById = UtilServiceStatus.done;
  List listAllFoods = [];
  List listAllFoodsBkp = [];
  List listFilterSelected = [];
  Map selectedProduct = {};
  String idRefSelected = '';

  Future<void> searchAllFoods() async {
    if (listAllFoods.isEmpty) {
      loadingAllFoods = UtilServiceStatus.loading;
      await foodService.getAllFoods().then((value) {
        listAllFoods = jsonDecode(value);
        listAllFoodsBkp = [...listAllFoods];
        loadingAllFoods = UtilServiceStatus.done;
      }).catchError((error) {
        loadingAllFoods = UtilServiceStatus.error;
      });
    }
    update();
  }

  Future<void> getProductById({required String id}) async {
    loadingProductById = UtilServiceStatus.loading;
    await foodService.getProductById(id).then((value) {
      selectedProduct = value;
      loadingProductById = UtilServiceStatus.done;
    }).catchError((error) {
      loadingProductById = UtilServiceStatus.error;
    });
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
        return element['categoria'].toString().toLowerCase().contains(filter.toLowerCase());
      }).toList();

      listaFiltrada = [...List.from(Set.from(listaFiltrada).union(Set.from(listaAllFoodsFiltrada)))];
    }

    listAllFoods = [...listaFiltrada];

    update();
  }

  void clearList() {
    idRefSelected = '';
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
        return element['grupo'].toString().toLowerCase().contains(filter.toLowerCase());
      }).toList();

      listaFiltrada = [...List.from(Set.from(listaFiltrada).union(Set.from(listaAllFoodsFiltrada)))];
    }

    listAllFoods = [...listaFiltrada];

    update();
  }
}
