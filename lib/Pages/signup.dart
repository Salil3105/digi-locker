// imports
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../Widgets/Buttons.dart';
import '../Widgets/Input.dart';
import 'home.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Future<void> signupAPI() async {
  //   final response = await http.post(
  //     Uri.parse('https://api.thevirustracker.com/free-api?countryTotal=US'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(
  //       <String, String>{
  //         'email': _emailController.text,
  //         'password': _passwordController.text,
  //       },
  //     ),
  //   );
  // }

  Future<bool> signup() async {
    print("In Signup Function");
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://172.22.123.34:5000/auth/signup'));
    request.body = json.encode({"emailID": "", "password": ""});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

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
    String password;
    String email;
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
                    onTap: () {
                      setState(() {
                        String newEmail = "";
                        email = newEmail;
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
                      child: TextField(
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
                    onTap: () {
                      setState(() {
                        
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
                      child: TextField(
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

                  GestureDetector(
                    onTap: () {
                      setState(() {

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
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15.0),
                          border: InputBorder.none,
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),

                  // Buttons
                  Buttons(
                    text: 'Sign Up',
                    task: () {
                      // if (signup() == true) {
                      //   print("Signup Successful");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Login(),
                          ),
                        );
                      } 
                      // else {
                      //   print("Error");
                      // }
                    // },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
