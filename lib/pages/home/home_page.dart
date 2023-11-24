import 'package:flutter/material.dart';
import 'package:projeto_tcc/pages/home/diet/diet_page.dart';
import 'package:projeto_tcc/pages/home/history/history_page.dart';
import 'package:projeto_tcc/pages/home/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
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