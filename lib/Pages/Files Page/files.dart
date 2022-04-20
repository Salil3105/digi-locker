import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class File_Screen extends StatefulWidget {
  const File_Screen({Key? key}) : super(key: key);

  @override
  State<File_Screen> createState() => _File_ScreenState();
}

class _File_ScreenState extends State<File_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: Text(
          '   Files',
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
          'File Screen Page',
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
