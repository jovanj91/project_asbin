import 'package:flutter/material.dart';
import 'sign_in_form.dart';
import 'package:project_asbin/utils/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                
              ],
            ),
          ),
        ),
      )
    );
  }

}

