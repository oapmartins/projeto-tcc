import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/pages/home/search_food/search_food_controller.dart';
import 'package:projeto_tcc/util/util_status_server.dart';

class SearchFoodPage extends StatefulWidget {
  const SearchFoodPage({super.key});

  @override
  State<SearchFoodPage> createState() => _SearchFoodPageState();
}

class _SearchFoodPageState extends State<SearchFoodPage> {
  @override
  void initState() {
    Get.find<SearchFoodController>().idRefSelected = Get.arguments['ref_id'];
    super.initState();
  }

  @override
  void dispose() {
    Get.find<SearchFoodController>().clearList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Alimentos'),
        ),
        body: GetBuilder(builder: (SearchFoodController controller) {
          if (controller.loadingAllFoods == UtilServiceStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.loadingAllFoods == UtilServiceStatus.error) {
            return const Center(child: Text('Erro ao realizar consulta de todos os alimentos!'));
          }

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 10,
                pinned: true,
                toolbarHeight: 100,
                expandedHeight: 230,
                title: Column(
                  children: [
                    SearchBar(
                      hintText: 'Buscar...',
                      controller: controller.searchBarController,
                      onChanged: controller.filterList,
                      trailing: [
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.x, size: 13),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade300),
                          ),
                          onPressed: controller.clearList,
                          color: Colors.black,
                        )
                      ],
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.only(left: 16, right: 8),
                      ),
                      elevation: const MaterialStatePropertyAll(1),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      leading: const Icon(
                        Icons.search,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCheckBoxGroup(
                        buttonTextStyle: const ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(
                            fontSize: 16,
                          ),
                          selectedTextStyle: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.w700,
                          ),
                        ),
                        unSelectedColor: Theme.of(context).canvasColor,
                        buttonLables: const [
                          'Todos',
                          'Frutas e derivados',
                          'Carnes',
                          'Frios e laticinios',
                          'Hortifruti',
                          'Mercearia',
                          'Padaria',
                          'Tem preço',
                          'Não tem preço',
                        ],
                        buttonValuesList: const [
                          'Todos',
                          'Frutas e derivados',
                          'aves-carnes-e-peixes',
                          'frios-e-laticinios',
                          'hortifruti',
                          'mercearia',
                          'padaria-e-rotisseria',
                          'pussui-preco',
                          'nao-pussui-preco',
                        ],
                        checkBoxButtonValues: controller.clickFilterSelect,
                        // spacing: 5,
                        selectedBorderColor: Colors.transparent,
                        unSelectedBorderColor: Colors.transparent,
                        defaultSelected: const ["Todos"],
                        horizontal: false,
                        enableButtonWrap: true,
                        autoWidth: true,
                        enableShape: true,
                        shapeRadius: 10,
                        padding: 20,
                        absoluteZeroSpacing: true,
                        wrapAlignment: WrapAlignment.spaceBetween,
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                        selectedColor: Colors.black87,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SliverList.builder(
                  itemCount: controller.listAllFoods.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(6)),
                          color: Colors.green.shade100,
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.listAllFoods[index]['nome'].toString(),
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text('${controller.listAllFoods[index]['medida_nome'].toString()} / '),
                                  // const SizedBox(width: 10),
                                  Text(
                                    '${controller.listAllFoods[index]['calorias'].toString()} kcal',
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: controller.listAllFoods[index]['possui_valor'] != null,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.green,
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.dollarSign,
                                            color: Colors.green,
                                            size: 12,
                                          ),
                                          Text(
                                            'Possui preço',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              await controller.getProductById(
                                id: controller.listAllFoods[index]['id'].toString(),
                              );
                              Get.toNamed('add-food');
                            },
                            icon: const Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                            style: IconButton.styleFrom(backgroundColor: Colors.green.shade600),
                          ),
                          tileColor: Colors.grey.shade200,
                        ),
                      ),
                    );
                  }),
            ],
          );
        }),
      ),
    );
  }
}
