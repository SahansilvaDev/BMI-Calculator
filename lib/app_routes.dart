import 'package:get/get.dart';

///import files where need to navigation
import 'home_screen.dart';
import 'info_screen.dart';

//AppPages class
abstract class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.info, page: () => InfoScreen()),
  ];
}

//AppRoutes class
abstract class AppRoutes {
  static const home = _Paths.home;
  static const info = _Paths.info;
}

class _Paths {
  static const home = '/home';
  static const info = '/info';
}
