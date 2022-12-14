import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_asbin/utils/constant.dart';
import 'package:project_asbin/utils/size_config.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';
import 'sign_in_form.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar( 
        title: Text("Sign In", ), centerTitle: true,
      
      ),

      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text("Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Text("Sign In with email and password \n to continue",
                    textAlign: TextAlign.center),
                  SizedBox(height: SizeConfig.screenHeight * 0.08,),
                  LoginForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.08,),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: Colors.black,
                      fontFamily: 'Poppins'
                      ),
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                          ..onTap = (){
                            Get.toNamed(Routes.SIGNUP);
                          },
                          text: 'Sign Up',
                          style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: kPrimaryColor,
                          fontFamily: 'Poppins' )
                        )
                      ]
                    )
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
