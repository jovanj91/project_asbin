import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/size_config.dart';
import '../../splash/views/body.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Scaffold(
      body:Body(), 
    );
  }
}
