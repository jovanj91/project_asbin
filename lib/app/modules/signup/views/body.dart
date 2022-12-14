import 'package:flutter/material.dart';
import 'package:project_asbin/utils/constant.dart';
import 'sign_up_form.dart';
import 'package:project_asbin/utils/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              SizedBox(height: SizeConfig.screenHeight*0.07,),
              Text(
                "By continuing, you confirm that you agree \n with our Term and Condition ", 
                textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}

