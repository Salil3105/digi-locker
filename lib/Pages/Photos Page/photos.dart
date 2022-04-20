import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Photos_Screen extends StatefulWidget {
  const Photos_Screen({Key? key}) : super(key: key);

  @override
  State<Photos_Screen> createState() => _Photos_ScreenState();
}

class _Photos_ScreenState extends State<Photos_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: Text(
          '    Photos',
          style: GoogleFonts.mina(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Text(
          'Photos Screen Page',
          style: GoogleFonts.mina(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
