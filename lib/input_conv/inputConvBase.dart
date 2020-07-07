import 'package:flutter/material.dart';
import 'package:sci_conv/input_conv/inputConvMainClass.dart';
import 'package:sci_conv/main.dart';
import 'inputConvhelp.dart';

class inputConvertor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'input Quantity convertor',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap:(){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> MyApp()));
              },
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
            actions: <Widget>[
              IconButton(
                  icon:Icon(Icons.help, color: Colors.black,),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=> inputHelper())
                    );
                  },
              )
            ],
            title: Text("투입량 변환", style: TextStyle(color: Colors.black) ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
          ),
            body: MainClass(),
        )
    );
  }
}

