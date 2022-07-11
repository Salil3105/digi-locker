// imports
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../Widgets/Buttons.dart';
import '../../Widgets/Input.dart';
import '../Home Page/home.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Future handleSignUp() async {
    var firstnameController = _firstnameController.text;
    var lastnameController = _lastnameController.text;
    var emailController = _emailController.text;
    var passwordController = _passwordController.text;
    print("\n");
    print("Firstname: $firstnameController");
    print("Lastname: $lastnameController");
    print("Email : $emailController");
    print("Password : $passwordController");
    print("\n");
    var url = 'http://172.25.54.75:4000/auth/register';
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode({
      'first_name': firstnameController,
      'last_name': lastnameController,
      'email': emailController,
      'password': passwordController,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("Registration Successful");
      Get.toNamed('/login');
      Get.snackbar(
        "Register",
        'Register Successfully',
        duration: Duration(seconds: 1),
      );
    } else {
      print(response.reasonPhrase);
      print("Registration Failed");
    }
  }

  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String password;
    String email;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(134, 233, 228, 228),
          border: Border.all(
            // color: Colors.red,
            width: 5.0,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 280.0,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          child: Lottie.network(
                            "https://assets2.lottiefiles.com/packages/lf20_q5pk6p1k.json",
                            animate: true,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          child: Lottie.network(
                            "https://assets3.lottiefiles.com/packages/lf20_nwfrjcrb.json",
                            animate: true,
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
                          "Welcome to DIGI LOCKER ",
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
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                    // Inputs(label: 'First name ', obscureText: false),
                    // Inputs(label: 'Last name ', obscureText: false),
                    // Inputs(label: 'Email Id', obscureText: false),
                    // Inputs(label: 'Password ', obscureText: true),
                    // Inputs(label: 'Confirm Password   ', obscureText: true),

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
                          controller: _firstnameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: InputBorder.none,
                            hintText: "First name",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
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
                          controller: _lastnameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: InputBorder.none,
                            hintText: "Last name",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(25, 10, 25, 3),
                        padding: const EdgeInsets.all(5.0),
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
                          obscureText: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: InputBorder.none,
                            hintText: "Email Id",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(25, 10, 25, 3),
                        padding: const EdgeInsets.all(5.0),
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
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0),

                    // Buttons
                    // Buttons(
                    //   text: 'Sign Up',
                    //   task: () {
                    //     Get.toNamed('/home');
                    //     Get.snackbar(
                    //       "Welcome to DiGi Locker 🔒",
                    //       "",
                    //       duration: Duration(seconds: 2),
                    //     );
                    //   },
                    // ),
                    MaterialButton(
                      onPressed: () {
                        handleSignUp();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50.0,
                      minWidth: 310.0,
                      splashColor: Color.fromARGB(255, 110, 186, 221),
                      color: Color.fromARGB(255, 72, 187, 240),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.black12, width: 0.1),
                      // ),
                      height: 50.0,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/login');
                          },
                          child: Text(
                            "Login ?",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 72, 187, 240),
                            ),
                          ),
                        ),
                      ),
                    ),
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
