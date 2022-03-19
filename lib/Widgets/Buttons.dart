import 'package:digi_locker_app/Pages/home.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  final Function task;
  const Buttons({
    Key? key,
    required this.text,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        task();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 40.0,
      minWidth: 300.0,
      splashColor: Color.fromARGB(255, 235, 170, 117),
      color: Color.fromARGB(255, 221, 119, 79),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
