import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:project_asbin/app/controllers/auth_controller.dart';
import 'package:project_asbin/app/controllers/mess_controller.dart';
import 'package:project_asbin/app/controllers/rtdb_controller.dart';
import 'package:project_asbin/utils/default_button.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/size_config.dart';

import '../controllers/monitoringpage_controller.dart';

class MonitoringpageView extends GetView<MonitoringpageController> {
  final rtdbC = Get.find<RtdbController>();
  final authC = Get.find<AuthController>();
  final messC = Get.find<MessController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text("Indikator Tempat Sampah",textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold
                )
              ),
              
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ 
                  GetX<RtdbController>(
                      builder: (_)=> CircularPercentIndicator(
                      radius: 60, 
                      progressColor: MonitoringpageController().progressColorT(),
                      animateFromLastPercent: true,
                      animation: true,
                      animationDuration: 1000,  
                      //percent:   ((double.parse('${rtdbC.databasejsonJarak}')/50 )* 100)/100,
                      percent:  rtdbC.persJ(),
                      center: GetX<RtdbController>(
                      builder: (_)=>
                        Text(rtdbC.persJString().value + "%\n"+'${rtdbC.databasejsonJarak}' + "cm",
                        textAlign: TextAlign.center,),
                    ),
                      footer: Text("Tinggi"),
                    ),
                  ),
                  GetX<RtdbController>(
                    builder:(_)=> CircularPercentIndicator(
                      radius: 60, 
                      progressColor: MonitoringpageController().progressColorB(),
                      animateFromLastPercent: true,
                      animation: true,
                      animationDuration: 1000,
                      // percent: ((double.parse('${rtdbC.databasejsonBerat}')/15000 )* 100)/100,
                      percent: rtdbC.persW(),
                      center:  GetX<RtdbController>(
                      builder: (_)=>
                        Text( rtdbC.persWString().value + "%\n" +'${rtdbC.databasejsonBerat}' + "g", 
                          textAlign: TextAlign.center,)
                    ),
                      footer: Text("Berat"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              GetX<RtdbController>(
                builder:(_)=> CircularPercentIndicator(
                      radius: 100, 
                      progressColor: MonitoringpageController().progressColorC(),
                      animateFromLastPercent: true,
                      animation: true,
                      animationDuration: 1000,
                      percent: rtdbC.persC(),
                      center: GetX<RtdbController>(
                      builder: (_)=>
                        Text( rtdbC.persCString().value + "%")
                    ),
                      footer: Text("Kapasitas"),
                    ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              
            ],
          )
          ),
      ),
    );
  }

}