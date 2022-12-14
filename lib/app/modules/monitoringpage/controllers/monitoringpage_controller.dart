import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_asbin/app/controllers/rtdb_controller.dart';
import 'package:project_asbin/utils/constant.dart';

class MonitoringpageController extends GetxController {
  final count = 0.obs;
  final rtdbC = Get.find <RtdbController>();
  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Color progressColorC(){
    if (rtdbC.persC() > 0.5 && rtdbC.persC() < 0.8 ){
      return Colors.yellow;
    } else if(rtdbC.persC() >= 0.8){
      return Colors.red;
    }
    else{
      return kPrimaryColor;
    }
  }  

  Color progressColorB(){
    if (rtdbC.persW() > 0.5 && rtdbC.persW() < 0.8 ){
      return Colors.yellow;
    } else if(rtdbC.persW() >= 0.8){
      return Colors.red;
    }
    else{
      return kPrimaryColor;
    }
  }  
  Color progressColorT(){
    if (rtdbC.persJ() > 0.5 && rtdbC.persJ() < 0.8 ){
      return Colors.yellow;
    } else if(rtdbC.persJ() >= 0.8){
      return Colors.red;
    }
    else{
      return kPrimaryColor;
    }
  }  
}
