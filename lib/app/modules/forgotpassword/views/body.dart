// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:project_asbin/utils/custom_suffix_icon.dart';
import 'package:project_asbin/utils/default_button.dart';
import 'package:project_asbin/utils/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text("Forgot Password?", 
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28), 
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text("Please enter your email and we will send\n you a link to return your account", 
                textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.screenHeight *0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),

    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
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
        ),
        SizedBox(height: getProportionateScreenHeight(30),),
        DefaultButton(text: "Send Request", press: (){}, icon: Icons.send,),
        SizedBox(height: SizeConfig.screenHeight * 0.1),
        
      ]
      ),
    );
  }
}