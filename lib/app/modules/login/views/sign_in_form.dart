import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_asbin/app/controllers/auth_controller.dart';
import 'package:project_asbin/app/modules/login/controllers/login_controller.dart';
import 'package:project_asbin/utils/custom_suffix_icon.dart';
import 'package:project_asbin/utils/default_button.dart';
import 'package:project_asbin/utils/constant.dart';

import 'package:project_asbin/utils/size_config.dart';

import '../../../routes/app_pages.dart';




class LoginForm extends GetView<LoginController> {

  final authC = Get.find<AuthController>();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20),),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20),),
          Row(
            children: [
              Checkbox(
                value: false, 
                activeColor: kPrimaryColor,
                onChanged: (value){
                  
                }),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(Routes.FORGOTPASSWORD),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          DefaultButton(text: "Login", icon: Icons.login, press: (){
            authC.login(controller.emailC.text, controller.passwordC.text);
          }),
          SizedBox(height: getProportionateScreenHeight(20),),
      ],
        
      ),
    );
  }

  

  TextFormField buildPasswordFormField() {
    return TextFormField(
          obscureText: true,
          controller: controller.passwordC,
          autovalidateMode : AutovalidateMode.onUserInteraction,
            validator: (value) =>
              value != null && value.length< 6
                ? 'Enter minimal 6 characters'
                : null,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: customSuffixIcon(svgIcon: "assets/icons/outline/svg/lock-outline.svg"),
          ),
        );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
          keyboardType: TextInputType.emailAddress,
          autovalidateMode : AutovalidateMode.onUserInteraction,
          controller: controller.emailC,
          validator: (email) =>
              email != null && !EmailValidator.validate(email)
                ? 'Enter  a valid mail'
                : null,
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: customSuffixIcon(svgIcon: "assets/icons/outline/svg/email-outline.svg"),
          ),
        );
  }

  //   Future signIn() async{ 
  //   showDialog(
  //     context: context, 
  //     barrierDismissible: false,
  //     builder: (context)=> Center(child: CircularProgressIndicator())
  //     );

  //   try{
  //      await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(), 
  //       password: passwordController.text.trim(),
  //     );
  //   } on FirebaseAuthException catch ( e){
  //     print (e);

  //     Utils.showSnackBar(e.message);
  //   }
  //   //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  // } 
}


