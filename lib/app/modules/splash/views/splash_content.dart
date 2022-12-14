import 'package:flutter/material.dart';
import 'package:project_asbin/utils/size_config.dart';
import 'package:project_asbin/utils/constant.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key, required this.text, required this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        Spacer(),
        Text("AsBin", 
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(text, textAlign: TextAlign.center,),
        Spacer(flex: 2,),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235)),            
        
      ],
    );
  }
}