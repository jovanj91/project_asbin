import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_asbin/utils/constant.dart';
import 'package:project_asbin/utils/size_config.dart';

import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';
import 'sign_up_form.dart';


class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight*0.01,),
              Text(
                "Register Account", 
                style: headingStyle,
              ),
              Text(
              "Complete your account details below", 
              textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight*0.05,),
              SignUpForm(),
              Text(
                "By continuing, you confirm that you agree \n with our Term and Condition ", 
                textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.screenHeight*0.02,),
              RichText(
                    text: TextSpan(
                      style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: Colors.black,
                      fontFamily: 'Poppins'
                      ),
                      text: "Already have Account? ",
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap =(() {
                            Get.offAllNamed(Routes.LOGIN);
                          }),
                          text: 'Sign In',
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
    ),
    );
  }
}
