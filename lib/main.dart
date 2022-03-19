// // imports
import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/login.dart';
import 'Pages/signup.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/home', page: ()=> Home()),
        GetPage(name: '/login', page: ()=> Login()),
        GetPage(name: '/signup', page: ()=> Signup()),
      ],
      // initialRoute: '/login',
      home: Scaffold(
        // body: Login(),
        body: Signup(),
        
      ),
    ),
  );
}
