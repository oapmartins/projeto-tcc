import 'package:get/get.dart';
import 'package:projeto_tcc/home/home_page.dart';
import 'package:projeto_tcc/pages/allergy/allergy_page.dart';
import 'package:projeto_tcc/home/diet/diet_page.dart';
import 'package:projeto_tcc/pages/goals/goals_page.dart';

import '../pages/login/login_page.dart';
import '../pages/register/register_page.dart';

List<GetPage> routesApp = [
  GetPage(name: '/home', page: () => const HomePage()),
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/register', page: () => const RegisterPage()),
  GetPage(name: '/goals', page: () => const GoalsPage()),
  GetPage(name: '/allergy', page: () => const AllergyPage()),
  GetPage(name: '/diet', page: () => const DietPage()),
];
