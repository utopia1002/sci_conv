import 'package:flutter/material.dart';
import 'package:sci_conv/input_conv/inputConvBase.dart';
import 'package:sci_conv/molality/molality_base.dart';
import 'slide.dart';

class MyAppBase extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyAppBaseState();
}

class _MyAppBaseState extends State<MyAppBase>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _buildApp(),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildApp(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
    Center(child:Text("공돌이 푸", style: TextStyle(
        fontSize: 50, color: Colors.black, fontWeight: FontWeight.w700
        )
    ), heightFactor: 3,),
    Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                sliderState(),
              ],
            ),
        ),
      ],
    );
  }
}
