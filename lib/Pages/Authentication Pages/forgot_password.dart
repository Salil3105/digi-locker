import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/Buttons.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(134, 233, 228, 228),),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.black12),
                  // ),
                  height: 250.0,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      // Positioned(
                      //   // bottom: 0,
                      //   child: Container(
                      //       alignment: Alignment.center,
                      //     child: Lottie.network(
                      //       "https://assets3.lottiefiles.com/packages/lf20_sukvt8nd.json",
                      //       animate: true,
                      //     ),
                      //   ),
                      // ),

                      Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          child: Lottie.network(
                            "https://assets5.lottiefiles.com/private_files/lf30_GjhcdO.json",
                            animate: true,
                          ),
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
                      margin: const EdgeInsets.all(30),
                      height: 45.0,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10.0),
                      //   border: Border.all(
                      //       color: const Color.fromARGB(255, 235, 196, 105),
                      //       width: 2.0),
                      // ),
                      child: Center(
                        child: Text(
                          "Forgot Password ?",
                          style: GoogleFonts.mina(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),

                    // ---------------------------------------------------------------------

                    // Inputs
                    // Inputs(label: 'First name ', obscureText: false),
                    // Inputs(label: 'Last name ', obscureText: false),
                    // Inputs(label: 'Email Id', obscureText: false),
                    // Inputs(label: 'Password ', obscureText: true),
                    // Inputs(label: 'Confirm Password   ', obscureText: true),

                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(15, 10, 15, 3),
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

                    // GestureDetector(
                    //   onTap: () {
                    //     setState(() {});
                    //   },
                    //   child: Container(
                    //     margin: const EdgeInsets.fromLTRB(15, 10, 15, 3),
                    //     padding: const EdgeInsets.all(5.0),
                    //     decoration: BoxDecoration(
                    //       color: Colors.white30,
                    //       borderRadius: BorderRadius.circular(12.0),
                    //       border: Border.all(
                    //         color: Color.fromARGB(255, 198, 42, 39),
                    //         width: 0.1,
                    //       ),
                    //     ),
                    //     child: TextField(
                    //       obscureText: true,
                    //       decoration: InputDecoration(
                    //         contentPadding: EdgeInsets.all(15.0),
                    //         border: InputBorder.none,
                    //         hintText: "Password",
                    //         hintStyle: TextStyle(color: Colors.grey),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    SizedBox(height: 20.0),

                    // Buttons
                    Buttons(text: 'Submit', task: () {}
                        // else {
                        //   print("Error");
                        // }
                        // },
                        ),
                  ],
                ),
                Positioned(
                  // bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: Lottie.network(
                      "https://assets1.lottiefiles.com/packages/lf20_ysbhqsuf.json",
                      animate: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
