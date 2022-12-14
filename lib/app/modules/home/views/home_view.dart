// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_asbin/app/controllers/auth_controller.dart';
import 'package:project_asbin/app/modules/controlpage/views/controlpage_view.dart';
import 'package:project_asbin/app/modules/monitoringpage/views/monitoringpage_view.dart';
import 'package:project_asbin/app/modules/profilepage/views/profilepage_view.dart';
import 'package:project_asbin/utils/constant.dart';
import 'package:project_asbin/utils/size_config.dart';
import '../controllers/home_controller.dart';


class HomeView extends StatelessWidget {
  final authC = Get.find<AuthController>();
  final homeC = Get.find<HomeController>();
  @override 
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Set<Widget> _widgetOptions = <Widget>{
      Text('Control'),
      Text('Monitoring'),
      Text('Profile'),
  };
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
      appBar: AppBar(
        title: _widgetOptions.elementAt(homeC.tabIndex),
        centerTitle: true,
        actions: [
          homeC.tabIndex != 0 && homeC.tabIndex != 1 
          ?IconButton(onPressed: () => authC.logout(), icon: Icon(Icons.logout))
          :Text("")
        ],
      ),
      body: SafeArea(
        child: IndexedStack(      
          index : homeC.tabIndex,
          children :[
            ControlpageView(),
            MonitoringpageView(),
            ProfilepageView(),
          ]
        )
      ),
     // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home,),backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: kSecondaryColor,
        selectedItemColor: kPrimaryColor,
        onTap: homeC.changeTabIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: homeC.tabIndex,
        type: BottomNavigationBarType.fixed,
        items: [
           _bottomNavigationBarItem(icon: Icons.signal_wifi_4_bar, label: 'Control'),
           _bottomNavigationBarItem(icon: Icons.home, label: 'Home'),
          _bottomNavigationBarItem(icon: Icons.person, label: 'Profile')
          ],
       
      ),
    
    );
    }
    );
  }

  _bottomNavigationBarItem({IconData? icon, String? label}){
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label
    );
  }
}



