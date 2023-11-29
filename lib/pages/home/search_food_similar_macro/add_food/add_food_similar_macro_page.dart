import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/pages/home/diet/diet_controller.dart';
import 'package:projeto_tcc/pages/home/search_food_similar_macro/search_food_similar_macro_controller.dart';
import 'package:projeto_tcc/util/util_status_server.dart';

class AddFoodSimilarMacroPage extends StatefulWidget {
  const AddFoodSimilarMacroPage({super.key});

  @override
  State<AddFoodSimilarMacroPage> createState() => _AddFoodSimilarMacroPageState();
}

class _AddFoodSimilarMacroPageState extends State<AddFoodSimilarMacroPage> {
  @override
  void dispose() {
    Get.find<SearchFoodSimilarMacroController>().clearVariables();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Alimento'),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<SearchFoodSimilarMacroController>(
            builder: (SearchFoodSimilarMacroController controller) {
          if (controller.loadingProductById == UtilServiceStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.loadingProductById == UtilServiceStatus.error) {
            return const Center(child: Text('Erro ao realizar consulta das informações do alimento!'));
          }

          return Column(
            children: [
              Container(
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Antigo',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              controller.alimentoAnteriorTroca['nome'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.lock,
                                color: Colors.black,
                                size: 18,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Valor estimado',
                                style: TextStyle(color: Colors.grey.shade900, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: Get.size.width * .35,
                            child: TextFormField(
                              enableInteractiveSelection: false,
                              enabled: false,
                              style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                hintText: controller.formatador
                                    .format(controller.alimentoAnteriorTroca['medidas']['preco_medida']),
                                hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade700,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade700,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      'Carb',
                                      style: TextStyle(
                                        color: Colors.brown,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      controller.alimentoAnteriorTroca['medidas']['carboidratos']
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey.shade700,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Gorduras',
                                      style: TextStyle(
                                        color: Colors.yellow.shade900,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      controller.alimentoAnteriorTroca['medidas']['gorduras totais']
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey.shade700,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'Proteínas',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      controller.alimentoAnteriorTroca['medidas']['proteínas']
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey.shade700,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'Calorias',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      controller.alimentoAnteriorTroca['medidas']['valor energético (kcal)']
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey.shade700,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 5,
                width: Get.size.width,
                color: Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Novo',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            controller.selectedProduct['nome'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tamanho da porção',
                          style: TextStyle(color: Colors.grey.shade900, fontSize: 16),
                        ),
                        SizedBox(
                          width: Get.size.width * .35,
                          child: DropdownButtonFormField(
                            isExpanded: true,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              hintText: controller.selectedProduct['porcao'].toString(),
                              hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade700,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            value: controller.valueDropDown,
                            items: controller.listPorcoes.map((medida) {
                              return DropdownMenuItem<String>(
                                value: medida.key,
                                child: Text(medida.key),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.valueDropDown = value ?? '';
                              controller.selectPorcao(value ?? '');
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quantidade de porções',
                          style: TextStyle(color: Colors.grey.shade900, fontSize: 16),
                        ),
                        SizedBox(
                          width: Get.size.width * .35,
                          child: TextFormField(
                            controller: controller.qtdePorcaoController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2),
                            ],
                            maxLengthEnforcement: MaxLengthEnforcement.none,
                            onChanged: (value) {
                              controller.calculateMacroQtdePorcoes(value.isEmpty ? 1 : int.parse(value));
                            },
                            style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              hintText: '1',
                              hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade700,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.lock,
                              color: Colors.black,
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Valor estimado',
                              style: TextStyle(color: Colors.grey.shade900, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Get.size.width * .35,
                          child: TextFormField(
                            controller: controller.valorEstimadoController,
                            enableInteractiveSelection: false,
                            enabled: false,
                            style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              hintText: controller.formatador.format(
                                  (controller.selectedPorcao['preco_medida'] *
                                      (int.tryParse(controller.qtdePorcaoController.text) ?? 1))),
                              hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade700,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade700,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Carb',
                                    style: TextStyle(
                                      color: Colors.brown,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    (controller.selectedPorcao['carboidratos'] *
                                            (int.tryParse(controller.qtdePorcaoController.text) ?? 1))
                                        .toStringAsFixed(2),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade700,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Gorduras',
                                    style: TextStyle(
                                      color: Colors.yellow.shade900,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    (controller.selectedPorcao['gorduras totais'] *
                                            (int.tryParse(controller.qtdePorcaoController.text) ?? 1))
                                        .toStringAsFixed(2),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade700,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Proteínas',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    (controller.selectedPorcao['proteínas'] *
                                            (int.tryParse(controller.qtdePorcaoController.text) ?? 1))
                                        .toStringAsFixed(2),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade700,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Calorias',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    (controller.selectedPorcao['valor energético (kcal)'] *
                                            (int.tryParse(controller.qtdePorcaoController.text) ?? 1))
                                        .toStringAsFixed(2),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade700,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: Get.size.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          final quantidade = controller.qtdePorcaoController.text.isEmpty
                              ? 1
                              : int.parse(controller.qtdePorcaoController.text);

                          controller.selectedPorcao['carboidratos'] =
                              controller.selectedPorcao['carboidratos'] * quantidade;
                          controller.selectedPorcao['gorduras totais'] =
                              controller.selectedPorcao['gorduras totais'] * quantidade;
                          controller.selectedPorcao['preco_medida'] =
                              controller.selectedPorcao['preco_medida'] * quantidade;
                          controller.selectedPorcao['proteínas'] =
                              controller.selectedPorcao['proteínas'] * quantidade;
                          controller.selectedPorcao['valor energético (kcal)'] =
                              controller.selectedPorcao['valor energético (kcal)'] * quantidade;
                          controller.selectedPorcao['valor_medida'] =
                              controller.selectedPorcao['valor_medida'] * quantidade;

                          Get.find<DietController>().changeFoodRefeicao(
                            id: controller.idRefSelected,
                            food: {
                              'id': controller.selectedProduct['id'],
                              'nome': controller.selectedProduct['nome'],
                              'macroPredominante': controller.selectedProduct['macro_predominante'],
                              'quantidade': quantidade.toString(),
                              'medidas': controller.selectedPorcao,
                            },
                            position: controller.posicaoAlimentoAnteriorTroca,
                          );
                          Get.back();
                          Get.back();
                        },
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(Colors.green),
                        ),
                        child: const Text(
                          'Alterar alimento',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
