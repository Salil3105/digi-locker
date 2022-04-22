// // imports
import 'package:digi_locker_app/Pages/Drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import screens
import 'Pages/Home Page/home.dart';
import 'Pages/Authentication Pages/login.dart';
import 'Pages/Authentication Pages/signup.dart';
import 'Pages/Authentication Pages/forgot_password.dart';
import 'Pages/Home Page/bottomNavBar.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/signup', page: () => Signup()),
        GetPage(name: '/forgot-screen', page: () => ForgotPassword()),
        GetPage(name: '/bottom-nav-bar', page: () => BottomNavBar()),
        GetPage(name: '/drawer-slider', page: () => DrawerSlider()),
      ],
      initialRoute: '/login',
      home: Scaffold(
        body: BottomNavBar(),
      ),
    ),
  );
}
