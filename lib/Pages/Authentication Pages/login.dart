import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

import '../../Widgets/Buttons.dart';
import '../../Widgets/Input.dart';
import '../Home Page/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // API integration
  Future handleLogin() async {
    print("hello");
    var emailController = _emailController.text;
    var passwordController = _passwordController.text;
    print("\n");
    print("Email : $emailController");
    print("Password : $passwordController");
    print("\n");
    var url = 'http://172.25.54.75:4000/auth/login';
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode({
      "email": emailController,
      "password": passwordController,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("Successfully logged in");
      Get.snackbar(
        "Login ",
        'Login Successful',
        duration: Duration(seconds: 1),
      );
      print(await response.stream.bytesToString());
      Get.toNamed('/bottom-nav-bar');
    } else {
      Get.snackbar(
        "Login  Failed",
        'Login Failed',
        duration: Duration(seconds: 1),
        backgroundColor: Color.fromARGB(255, 231, 163, 159),
      );
      print("Failed to login");
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(134, 233, 228, 228),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 280.0,
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: Colors.black,
                  //     width: 2.0,
                  //   ),
                  // ),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          alignment: Alignment.center,
                          child: Lottie.network(
                            "https://assets4.lottiefiles.com/packages/lf20_06qof0oc.json",
                            animate: true,
                          ),
                        ),
                      ),
                      Positioned(
                        // Lock Image
                        child: Container(
                          alignment: Alignment.center,
                          child: Lottie.network(
                            "https://assets10.lottiefiles.com/packages/lf20_gcudkx1v.json",
                            animate: false,
                          ),
                          decoration: BoxDecoration(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(1.0),
                      height: 45.0,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10.0),
                      //   border: Border.all(
                      //       color: const Color.fromARGB(255, 235, 196, 105),
                      //       width: 2.0),
                      // ),
                      child: Center(
                        child: Text(
                          "Welcome to SafeDoc",
                          style: GoogleFonts.mina(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),

                    // ---------------------------------------------------------------------
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // border: Border.all(
                        //   color: const Color.fromARGB(255, 235, 196, 105),
                        //   width: 2.0,
                        // ),
                      ),
                      child: Center(
                        child: Text(
                          "Keep your data safe! 🔒",
                          style: GoogleFonts.mina(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 87, 84, 84),
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                    ),

                    // Inputs
                    // Inputs(label: 'Email Id', obscureText: false),
                    // Inputs(label: 'Password ', obscureText: true),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(25, 10, 25, 3),
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color.fromARGB(255, 72, 187, 240),
                            width: 0.1,
                          ),
                        ),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: InputBorder.none,
                            hintText: "Email Id",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 3),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color.fromARGB(255, 72, 187, 240),
                          width: 0.1,
                        ),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15.0),
                          border: InputBorder.none,
                          hintText: "Password ",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0),

                    // Buttons
                    // Buttons(
                    //   text: 'Login',
                    //   task: () {
                    //     // if (login() == true) {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => Home(),
                    //       ),
                    //     );
                    //     // } else {
                    //     //   print("Login Failed");
                    //     // }
                    //   },
                    // ),

                    MaterialButton(
                      onPressed: () {
                        handleLogin();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50.0,
                      minWidth: 310.0,
                      splashColor: Color.fromARGB(255, 110, 186, 221),
                      color: Color.fromARGB(255, 72, 187, 240),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0),

                    // Forgot Password Link
                    Container(
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.black12, width: 0.1),
                      // ),
                      height: 50.0,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/forgot-screen');
                          },
                          child: Text(
                            "Forgot password ?",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 72, 187, 240),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              "Don't have an account ?",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 72, 187, 240),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed('/signup');
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                " Register !",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 107, 99, 95),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
