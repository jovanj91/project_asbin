import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_asbin/app/controllers/auth_controller.dart';
import 'package:project_asbin/app/controllers/mess_controller.dart';
import 'package:project_asbin/utils/loading.dart';
import 'app/controllers/rtdb_controller.dart';
import 'app/routes/app_pages.dart';
import 'utils/theme.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
    print('Handling a background message ${message.messageId}');
}

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  final rtdbC = Get.put(RtdbController(), permanent: true);
  final messC = Get.put(MessController(), permanent: true);
  @override
  Widget build(BuildContext context)=>
    StreamBuilder<User?>(
          stream: authC.streamAuthStatus,
          builder:(context, snapshot) {
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState. active){
              return GetMaterialApp(
                debugShowCheckedModeBanner: false, 
                title: "AsBin",
                initialRoute: snapshot.data != null ?Routes.HOME : Routes.SPLASH, 
                // home: snapshot.data != null ? HomeView() : LoginView(),
                theme: theme(),
                getPages: AppPages.routes,
              );
            }else if(snapshot.connectionState == ConnectionState.waiting){
              return LoadingView();
            }else{
                return Text("Something Went Wrong");
            }
          }
        );  
}
  