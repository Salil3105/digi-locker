// // imports
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import screens
import 'Pages/home.dart';
import 'Pages/login.dart';
import 'Pages/signup.dart';
import 'Pages/forgot_password.dart';

void main() {
  runApp(
    GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/home', page: ()=> Home()),
        GetPage(name: '/login', page: ()=> Login()),
        GetPage(name: '/signup', page: ()=> Signup()),
        GetPage(name: '/forgot-screen', page: ()=> ForgotPassword()),
      ],
      // initialRoute: '/login',
      home: Scaffold(
        body: Login(),
        // body: Signup(),
        // body: ForgotPassword(),
        
      ),
    ),
  );
}
