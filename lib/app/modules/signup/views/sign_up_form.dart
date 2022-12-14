import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_asbin/app/controllers/auth_controller.dart';
import 'package:project_asbin/app/modules/signup/controllers/signup_controller.dart';
import 'package:project_asbin/utils/custom_suffix_icon.dart';
import 'package:project_asbin/utils/default_button.dart';
import 'package:project_asbin/utils/size_config.dart';


class SignUpForm extends GetView<SignupController> {

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20),),
          buildNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(20),),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20),),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20),),
          buildConfPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20),),
          DefaultButton(
            text: "Register", 
             icon: Icons.arrow_forward_rounded,
            press: ()=> authC.signup(
              controller.emailC.text, 
              controller.passwordC.text, 
              controller.nameC.text,
              controller.numberC.text,
              controller.confirmC.text
              ) )
        ],
      ),
    );
  }

  TextFormField buildNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller.numberC,
      autovalidateMode : AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(svgIcon: "assets/icons/outline/svg/phone-outline.svg"),
    ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
        autovalidateMode : AutovalidateMode.onUserInteraction,
        controller: controller.nameC,
        decoration: InputDecoration(
          labelText: "Name",
          hintText: "Enter your name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffixIcon(svgIcon: "assets/icons/outline/svg/person-outline.svg"),
      ),
      );
  }

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
        obscureText: true,
        controller: controller.confirmC,
        autovalidateMode : AutovalidateMode.onUserInteraction,
          validator: (value) =>
            value != null && value.length< 6 && value == controller.passwordC.text.trim()
              ? "Password is incorrect"
              : null,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffixIcon(svgIcon: "assets/icons/outline/svg/lock-outline.svg"),
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
          controller: controller.emailC,
          autovalidateMode : AutovalidateMode.onUserInteraction,
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
 
}
  

