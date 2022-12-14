import 'package:get/get.dart';

import '../controllers/rtdb_controller.dart';
import '../modules/controlpage/bindings/controlpage_binding.dart';
import '../modules/controlpage/views/controlpage_view.dart';
import '../modules/forgotpassword/bindings/forgotpassword_binding.dart';
import '../modules/forgotpassword/views/forgotpassword_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/monitoringpage/bindings/monitoringpage_binding.dart';
import '../modules/monitoringpage/views/monitoringpage_view.dart';
import '../modules/profilepage/bindings/profilepage_binding.dart';
import '../modules/profilepage/views/profilepage_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  final rtdbC = Get.find<RtdbController>();
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => const ForgotpasswordView(),
      binding: ForgotpasswordBinding(),
    ),
    GetPage(
      name: _Paths.CONTROLPAGE,
      page: () => ControlpageView(),
      binding: ControlpageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEPAGE,
      page: () => ProfilepageView(),
      binding: ProfilepageBinding(),
    ),
    GetPage(
      name: _Paths.MONITORINGPAGE,
      page: () => MonitoringpageView(),
      binding: MonitoringpageBinding(),
    ),
  ];
}
