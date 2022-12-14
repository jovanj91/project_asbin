import 'package:flutter/material.dart';
import 'package:project_asbin/utils/constant.dart';
import 'package:project_asbin/utils/size_config.dart';




class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key, required this.text, required this.press, required this.icon
  }) : super(key: key);
  final String text;
  final  press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => kPrimaryColor),
          shadowColor: MaterialStateColor.resolveWith((states) => Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: kPrimaryColor),
            )
          )
        ),
        icon: Icon(icon),
        label: Text( text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white),
        ), 
        onPressed: press,
      ),
    );
  }
}
