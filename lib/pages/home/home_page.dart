import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/pages/home/diet/diet_controller.dart';
import 'package:projeto_tcc/pages/home/diet/diet_page.dart';
import 'package:projeto_tcc/pages/home/history/history_page.dart';
import 'package:projeto_tcc/pages/home/profile/profile_page.dart';
import 'package:projeto_tcc/pages/home/search_food/search_food_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    if (!Get.isRegistered<SearchFoodController>()) {
      Get.put(SearchFoodController());
    }
    Get.find<DietController>().getUserDiet(id: FirebaseAuth.instance.currentUser?.uid ?? '');
    super.initState();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _listPages = <Widget>[
    DietPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              label: 'Dieta',
              icon: Icon(
                Icons.text_snippet_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Histórico',
              icon: Icon(
                Icons.text_snippet_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Perfil',
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
        body: _listPages.elementAt(_selectedIndex),
      ),
    );
  }
}
