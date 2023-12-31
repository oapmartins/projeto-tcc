import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({
    super.key,
    required this.textRefeicao,
    required this.dataRefeicao,
    required this.onTapVisualizar,
    required this.onTapVoltarRefeicao,
  });

  final String textRefeicao;
  final String dataRefeicao;
  final Function() onTapVisualizar;
  final Function() onTapVoltarRefeicao;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 0),
      child: Container(
        width: Get.size.width,
        height: 110,
        decoration: const BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: .2,
            image: NetworkImage(
              'https://t3.ftcdn.net/jpg/02/60/12/88/360_F_260128861_Q2ttKHoVw2VrmvItxyCVBnEyM1852MoJ.jpg',
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textRefeicao,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Text(
                  dataRefeicao,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      onTapVisualizar();
                    },
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                    ),
                    child: const Text(
                      'Visualizar',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      onTapVoltarRefeicao();
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
                      'Voltar refeição',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
