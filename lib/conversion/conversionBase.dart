import 'package:flutter/material.dart';
import 'package:sci_conv/conversion/conversion_state.dart';
import 'package:sci_conv/main.dart';

class conversion_base extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "conversion",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> MyApp())
                );
              },
              child: Icon(Icons.arrow_back, color:Colors.black)
            ),
            title: Text("conversion", style: TextStyle(color: Colors.black) ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
        ),
        body: conversion_state(),
        resizeToAvoidBottomPadding: false,
      )
    );
  }
}


