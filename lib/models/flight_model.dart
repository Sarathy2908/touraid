// ignore_for_file: prefer_const_constructors

import 'package:arjun/models/home_page.dart';
import 'package:flutter/material.dart';

class FlightModel extends StatefulWidget {
  const FlightModel({super.key});

  @override
  State<FlightModel> createState() => _FlightModelState();
}

class _FlightModelState extends State<FlightModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Goa",
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.w600, color: Colors.black),),
          leading:
          GestureDetector(
            child:
          Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 224, 224),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.keyboard_arrow_left_outlined),
          ),
            onTap:() {
              Navigator.of(context).pop(MaterialPageRoute(builder: (BuildContext context)=> HomePage()));
            }
      ),
      ),
      body: Center(
        child: Text("good"),
      ),
    );
  }
}
