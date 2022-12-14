import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_asbin/app/controllers/rtdb_controller.dart';
import 'package:project_asbin/utils/constant.dart';
import 'package:project_asbin/utils/default_button.dart';

import 'package:project_asbin/utils/size_config.dart';

import '../controllers/controlpage_controller.dart';

class ControlpageView extends GetView<ControlpageController> {
  final rtdbC = Get.find<RtdbController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text("Kontrol Tempat Sampah",textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.10),
              DefaultButton(text: 'Unlock', icon: Icons.lock_open,press: (){
                Get.defaultDialog(
                  title: "Konfirmasi",
                  titleStyle: TextStyle(color: kPrimaryColor),
                  middleText:"Apakah kamu yakin ingin membuka kunci tempat sampah?",
                  confirm: TextButton.icon(
                    onPressed: (){ 
                      if (rtdbC.opened == false){
                        rtdbC.LockOpen();
                        Navigator.of(context).pop();
                        Get.snackbar(
                          "Notice!", 
                          "Trash bin Unlocked", 
                          animationDuration: Duration(milliseconds: 500),
                          duration: Duration(milliseconds: 2000),
                          snackPosition: SnackPosition.BOTTOM,
                          snackStyle: SnackStyle.FLOATING, 
                          icon: Icon(Icons. check_circle));
                      }else{
                        Navigator.of(context).pop();
                        Get.snackbar(
                          "Notice!", 
                          "Trash bin already Unlocked", 
                          animationDuration: Duration(milliseconds: 500),
                          duration: Duration(milliseconds: 2000),
                          snackPosition: SnackPosition.BOTTOM,
                          snackStyle: SnackStyle.FLOATING, 
                          icon: Icon(Icons.report_gmailerrorred_rounded));
                      };
                    },
                    icon: Icon(Icons.thumb_up_rounded, color: kPrimaryColor), 
                    label:Text("Ya", style: TextStyle(color: kPrimaryColor))),
                  cancel: TextButton.icon(
                    onPressed: ()=> Navigator.of(context).pop(), 
                    icon: Icon(Icons.thumb_down_rounded, color: kPrimaryColor), 
                    label:Text("Tidak", style: TextStyle(color: kPrimaryColor))),
                   
                );
              }),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              DefaultButton(text: 'Lock', icon: Icons.lock_outline, press: (){
               Get.defaultDialog(
                  title: "Konfirmasi",
                  titleStyle: TextStyle(color: kPrimaryColor),
                  middleText:"Apakah kamu yakin ingin mengunci tempat sampah?",
                  confirm: TextButton.icon(
                    onPressed: (){ 
                      if (rtdbC.opened == true){
                        rtdbC.LockClose();
                        Navigator.of(context).pop();
                        Get.snackbar(
                          "Notice!", 
                          "Trash bin Locked", 
                          animationDuration: Duration(milliseconds: 500),
                          duration: Duration(milliseconds: 2000),
                          snackPosition: SnackPosition.BOTTOM,
                          snackStyle: SnackStyle.FLOATING, 
                          icon: Icon(Icons. check_circle));
                      }else{
                        Navigator.of(context).pop();
                        Get.snackbar(
                          "Notice!", 
                          "Trash bin already Locked", 
                          animationDuration: Duration(milliseconds: 500),
                          duration: Duration(milliseconds: 2000),
                          snackPosition: SnackPosition.BOTTOM,
                          snackStyle: SnackStyle.FLOATING, 
                          icon: Icon(Icons.report_gmailerrorred_rounded));
                      };
                    },
                    icon: Icon(Icons.thumb_up_rounded, color: kPrimaryColor), 
                    label:Text("Ya", style: TextStyle(color: kPrimaryColor))),
                  cancel: TextButton.icon(
                    onPressed: ()=> Navigator.of(context).pop(), 
                    icon: Icon(Icons.thumb_down_rounded, color: kPrimaryColor), 
                    label:Text("Tidak", style: TextStyle(color: kPrimaryColor))),
               );
              }),
            ]              
          )
        )
      )
    );
  }
}
