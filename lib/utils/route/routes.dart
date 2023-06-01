import 'package:flutter_mvvm_getx/utils/route/routes_name.dart';
import 'package:flutter_mvvm_getx/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.downToUp,
        ),
      ];
}
