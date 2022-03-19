// // imports
import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/login.dart';
import 'Pages/signup.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Login(),
        // body: Signup(),
      ),
    ),
  );
}
