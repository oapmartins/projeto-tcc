import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchFoodPage extends StatelessWidget {
  const SearchFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
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
        ),
      ),
    );
  }
}
