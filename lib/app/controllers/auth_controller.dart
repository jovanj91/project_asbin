// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;
  RxString mtoken ="".obs;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  //Profile
  Future<String> getToken() async {
    await FirebaseMessaging.instance.getToken().then(
      (token){
        mtoken.value = token!; //keknya problem
        print("My Token is $mtoken");

      }
    );
    return mtoken.value;
  }

  Future addUserDetails(String name, String number, String email, String? uid, Future<String> token) async {
      await store.collection("Users").doc("${uid}").set({
        'name' : name,
        'phone number' : number,
        'email': email,
        'token' : await token
    });
  }

  //Authentication
  Future signup(String email, String password,String name, String number, String confirm ) async {
    try { 
     await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final String? uid = auth.currentUser?.uid;
      final token = getToken();
      addUserDetails(name, number, email, uid, token);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Password Invalid", 
          "The password provided is too weak.", 
          animationDuration: Duration(milliseconds: 500),
          duration: Duration(milliseconds: 2000),
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING, 
          icon: Icon(Icons.report_gmailerrorred_rounded));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar(
          "Email Invalid", 
          "The account already exists for that email.", 
          animationDuration: Duration(milliseconds: 500),
          duration: Duration(milliseconds: 2000),
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING, 
          icon: Icon(Icons.report_gmailerrorred_rounded));
      }
    } catch (e) {
      print(e);
    }
    
  }

  Future login(String email, String password) async{
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
    Get.dialog(CircularProgressIndicator());   
    Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar(
          "Email Invalid", 
          "No user found for that email.", 
          animationDuration: Duration(milliseconds: 500),
          duration: Duration(milliseconds: 2000),
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING, 
          icon: Icon(Icons.report_gmailerrorred_rounded));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.snackbar(
          "Wrong Password", 
          "Wrong password provided for that user.", 
          animationDuration: Duration(milliseconds: 500),
          duration: Duration(milliseconds: 2000),
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING, 
          icon: Icon(Icons.report_gmailerrorred_rounded));
      }
    }
  }

  Future logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

}

class currentUser extends AuthController {

  String? currentUserUid(){
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return uid;
  }

  String? currentUserEmail(){
    User? user = auth.currentUser;
    final emailAddress = user?.email;
    return emailAddress; 
  }

  String? currentUserPhoto(){
    User? user = auth.currentUser;
    final photoURL = user?.photoURL;
    return photoURL; 
  }

  Future<String> currentUserName () async {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection("Users").doc("${currentUser().currentUserUid()}").get();
    String username = snap['name'].toString();  
    return username;
  }

  Future<String> currentUserPhone () async {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection("Users").doc("${currentUser().currentUserUid()}").get();
    String username = snap['phone number'].toString();  
    return username;
  }

  Future<String> currentUsermToken () async {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection("Users").doc("${currentUser().currentUserUid()}").get();
    String username = snap['token'].toString();  
    return username;
  }
 
}
