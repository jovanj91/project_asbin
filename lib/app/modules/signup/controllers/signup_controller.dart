import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final nameC= TextEditingController();
  final numberC = TextEditingController();
  final confirmC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    nameC.dispose();
    numberC.dispose();
    super.onClose();
  } 
}