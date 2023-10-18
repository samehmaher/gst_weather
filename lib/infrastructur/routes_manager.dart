import 'package:get/get.dart';

import '../domins/binding/home_binding.dart';
import '../page/home_view.dart';

class Routes {
  static const String home = "/home";

  static List<GetPage<dynamic>> systemPages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
