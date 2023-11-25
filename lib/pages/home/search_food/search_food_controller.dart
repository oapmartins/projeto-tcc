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
  UtilServiceStatus loadingAllFoods = UtilServiceStatus.done;
  UtilServiceStatus loadingProductById = UtilServiceStatus.done;
  List listAllFoods = [];
  List listAllFoodsBkp = [];
  List listFilterSelected = [];

  Future<List> searchAllFoods() async {
    var listFoods = [];
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
    return listFoods;
  }

  Future<void> getProductById({required String id}) async {
    loadingProductById = UtilServiceStatus.loading;
    foodService.getProductById(id).then((value) {
      loadingProductById = UtilServiceStatus.done;
    }).catchError((error) {
      loadingProductById = UtilServiceStatus.error;
    });
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
        return element['categoria'].toString().toLowerCase().contains(filter.toLowerCase());
      }).toList();

      listaFiltrada = [...List.from(Set.from(listaFiltrada).union(Set.from(listaAllFoodsFiltrada)))];
    }

    listAllFoods = [...listaFiltrada];

    update();
  }
}
