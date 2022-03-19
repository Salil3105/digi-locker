import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

import '../Widgets/Buttons.dart';
import '../Widgets/Input.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<bool> login() async {
    print("In Login Function");
    var headers = {'Content-Type': 'application/json'};
    var request = await http.Request(
        'POST', Uri.parse('http://172.22.123.34:5000/auth/login'));

    request.body = json.encode(
        {"emailID": "schandwadkar31@gmail.com", "password": "kuchabhi"});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('Request Body :",\n${response}');
    print("Response Code: ${response.statusCode}");

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = "";
    return Container(
      decoration: BoxDecoration(color: Colors.white54),
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
                          "https://assets7.lottiefiles.com/packages/lf20_rf7upa0j.json",
                          animate: false,
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
                  // Inputs(label: 'Email Id', obscureText: false),
                  // Inputs(label: 'Password ', obscureText: true),
                  GestureDetector(
                    onTap: () {
                      print("\nTapped\n");
                      setState(() {
                        String new_email;
                        new_email = email;
                        print(new_email);
                      });
                    },

                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 15, 3),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color.fromARGB(255, 198, 42, 39),
                          width: 0.1,
                        ),
                      ),
                      child: const TextField(
                        // obscureText: obscureText,
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
                    margin: const EdgeInsets.fromLTRB(15, 10, 15, 3),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Color.fromARGB(255, 198, 42, 39),
                        width: 0.1,
                      ),
                    ),
                    child: const TextField(
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
                      // if (login() == true) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Home(),
                      //     ),
                      //   );
                      // } else {
                      //   print("Login Failed");
                      // }
                      Get.toNamed('/home');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 40.0,
                    minWidth: 300.0,
                    splashColor: Color.fromARGB(255, 235, 170, 117),
                    color: Color.fromARGB(255, 221, 119, 79),
                    child: const Text(
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
                      child: Text(
                        "Forgot password ?",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 221, 119, 79),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 160.0),

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
                              color: Color.fromARGB(255, 221, 119, 79),
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
