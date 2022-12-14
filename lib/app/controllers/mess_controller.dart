import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_asbin/app/controllers/auth_controller.dart';
import 'package:project_asbin/app/routes/app_pages.dart';

class MessController extends GetxController {
  
  late DatabaseReference _dbref;
  final authC = Get.find<AuthController>();
 
  //TODO: Implement MessController
  
  @override
  void onInit (){
    super.onInit();
    _dbref = FirebaseDatabase.instance.ref();
    requestPermission();
    initInfo();
    messNotif(); 
   
    
  }

  Future<void>messNotif() async{
      await _dbref.child("databaseAsbin").child("control").child("kapasitas").onValue.listen((event) async {
      final CapSnap = event.snapshot;
      final CapSnapString = CapSnap.value.toString();
      DocumentSnapshot snap = await FirebaseFirestore.instance.collection("Users").doc("${currentUser().currentUserUid()}").get();
        String token = snap['token'];  
        print(token);
      var cap = double.parse(CapSnapString);
      if (cap > 70.0 ){
        sendPushMessage(token, "Kapasitas tempat sampah mencapai 70%, mohon untuk segera dibersihkan!", "Tempat Sampah Full");
      }

    });
  }
  
  initInfo(){
    var androidInitialize = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(android: androidInitialize);
    
    FlutterLocalNotificationsPlugin().initialize(initializationSettings, onSelectNotification: (String? payload) async{
      try{
        if(payload != null && payload.isNotEmpty){
            Get.offAllNamed(Routes.HOME);
        }
      }catch(e){

      }
      return;
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message)async {
      print("------onMessage-------");
      print("onMessage: ${message.notification?.title}/${message.notification?.body}");

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(), htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(), htmlFormatContentTitle: true,
      );
      AndroidNotificationDetails androidPlatformChannelSpesifics = AndroidNotificationDetails(
       'asbin', 'asbin', importance: Importance.high,
       styleInformation: bigTextStyleInformation, priority: Priority.high, playSound: true);
      NotificationDetails platformChannelSpesifics = NotificationDetails(android: androidPlatformChannelSpesifics);

      await FlutterLocalNotificationsPlugin().show(0, message.notification?.title, message.notification?.body, 
      platformChannelSpesifics, 
      payload: message.data['body']);
    });

  }
  
  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      print('User granted permission');
    }else if(settings.authorizationStatus==AuthorizationStatus.provisional){
      print('User granted provosional permission');
    }else{
      print('User declined or has not accepted permission');
    }
  }

 

  void sendPushMessage(String token, String body, String title) async{
    try{
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type' : 'application/json',
          'Authorization' : 'key=AAAA2jfnIJ4:APA91bF3EN6jAJA-yWG1UCpKybFvpelErU0LFcXVskRghXqlTewUIeORr1KbqgDRWNZpQEIj1ErsZzQcdLoUnx7djA14RiqP06W8O5IfFacOGYQ-TgBA9atg4llel45N9HNBOm0eNd5U'
        },
        body: jsonEncode(<String, dynamic>{
          'priority' : 'high',
          'data' :<String,dynamic>{
            'click_action' : 'FLUTTER_NOTIFICATION_CLICK',
            'status' : 'done',
            'body' : body,
            'title' : title
          },
          "notification" : <String, dynamic>{
            "title" : title,
            "body" : body,
            "android_channel_id" : "asbin"
          },
          "to" : token 
        },
        
        )
      );
    }catch(e){
      if(kDebugMode){
        print("error push notification");
      }        
    }
  } 

  
 
}
