import 'package:flutter/material.dart';
import 'package:project_asbin/app/modules/splash/views/splash_content.dart';
import 'package:project_asbin/utils/default_button.dart';

import 'package:project_asbin/utils/constant.dart';

import 'package:project_asbin/utils/size_config.dart';

import '../../../routes/app_pages.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>>splashData = [{
    
    "text": "Welcome to AsBin, Automatic TrashBin", 
    "image" : "assets/images/doodle1.png"
  },
  {
    "text": "We asisst you to monitor and manage your trash bin everyday", 
    "image" : "assets/images/doodle2.png"
  },
  {
    "text": "More Clean, More Healthy, More Happy", 
    "image" : "assets/images/doodle3.png"
  }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child : SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: ((value) {
                  setState(() {
                    currentPage = value;
                  });
              }),
                itemCount: splashData.length,
                itemBuilder: (context, index) => 
                  SplashContent(
                    text: splashData[index]['text'].toString(), 
                    image: splashData[index]['image'].toString()
                )
              )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length, 
                        (index) => buildDot(index: index)
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: (){
                        Navigator.of(context).pushNamed(Routes.LOGIN);
                      },
                      icon: Icons.arrow_forward,
                    ),
                    Spacer(flex: 3),
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }

 AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20:6,
      decoration: BoxDecoration(
        color: currentPage == index? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3)),
    );
  }
}



