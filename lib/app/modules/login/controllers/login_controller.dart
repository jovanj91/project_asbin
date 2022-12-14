import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final emailC = TextEditingController(text: "jovan@asbin.com");
  final passwordC = TextEditingController(text: "jovan123");


  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }

  
}
