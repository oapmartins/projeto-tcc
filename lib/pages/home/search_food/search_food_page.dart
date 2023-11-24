import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/pages/home/search_food/search_food_controller.dart';

class SearchFoodPage extends StatefulWidget {
  const SearchFoodPage({super.key});

  @override
  State<SearchFoodPage> createState() => _SearchFoodPageState();
}

class _SearchFoodPageState extends State<SearchFoodPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder(
            init: SearchFoodController(),
            builder: (SearchFoodController controller) {
              if (controller.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    toolbarHeight: 100,
                    title: SearchBar(
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0),
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
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: const Column(
                            children: [
                              Text('Contra Filé'),
                              Text('178 cal, 100 g, Friboi'),
                            ],
                          ),
                          trailing: const Icon(FontAwesomeIcons.circlePlus),
                          tileColor: Colors.grey.shade200,
                        ),
                      );
                    }),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
