// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_asbin/app/controllers/auth_controller.dart';
import 'package:project_asbin/utils/constant.dart';
import 'package:project_asbin/utils/size_config.dart';
import '../controllers/profilepage_controller.dart';

class ProfilepageView extends GetView<ProfilepageController> {
  final authC = Get.find<AuthController>();
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView(
        children: [
          Text(
            "Your Profile",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          Center(
            child: Stack(
              children: [
                Container(
                  width: getProportionateScreenWidth(120),
                  height: getProportionateScreenHeight(120),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).scaffoldBackgroundColor
                    ),
                    boxShadow:[ BoxShadow(
                      blurRadius:10 ,
                      spreadRadius:2,
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0,10)
                    ) 
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png")
                    )
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: getProportionateScreenHeight(40),
                    width: getProportionateScreenWidth(40),
                    child : Icon(Icons.edit, color: Color.fromARGB(255, 204, 198, 198),),
                    decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4, 
                      color: Theme.of(context).scaffoldBackgroundColor),
                    color: kPrimaryColor),
                  ))
              ],
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          FutureBuilder( //cara gunain future builder
            future: currentUser().currentUserName(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              return TextField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  hintText: snapshot.data,
                  // hintText: 
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal)
                ),
             );
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: currentUser().currentUserEmail(),
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal)
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          FutureBuilder( //cara gunain future builder
            future: currentUser().currentUserPhone(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              return TextField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  hintText: snapshot.data,
                  // hintText: 
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal)
                ),
             );
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          FutureBuilder( //cara gunain future builder
            future: currentUser().currentUsermToken(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              return TextField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: "mToken",
                  hintText: snapshot.data,
                  // hintText: 
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal)
                ),
             );
            },
          ),
        ],
      ),
    );
  }
  
  
}
