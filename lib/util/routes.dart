import 'package:get/get.dart';
import 'package:projeto_tcc/home/home_page.dart';
import 'package:projeto_tcc/home/search_food/search_food_page.dart';
import 'package:projeto_tcc/pages/allergy/allergy_page.dart';
import 'package:projeto_tcc/home/diet/diet_page.dart';

import '../pages/login/login_page.dart';
import '../pages/register/register_page.dart';

List<GetPage> routesApp = [
  GetPage(name: '/home', page: () => const HomePage()),
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/register', page: () => const RegisterPage()),
  GetPage(name: '/allergy', page: () => const AllergyPage()),
  GetPage(name: '/diet', page: () => const DietPage()),
  GetPage(name: '/search-food', page: () => const SearchFoodPage()),
];
