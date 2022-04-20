import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Star extends StatefulWidget {
  const Star({Key? key}) : super(key: key);

  @override
  State<Star> createState() => _StarState();
}

class _StarState extends State<Star> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.purpleAccent,
        //     width: 1,
        //   ),
        // ),
        child: Center(
          child: Text(
            'Starred',
            style: GoogleFonts.mina(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
