import 'package:flutter/material.dart';
import 'molarity_state.dart';
import 'package:sci_conv/main.dart';

class molarityBase extends StatelessWidget {

  @override
  Widget build(BuildContext context){
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
              title: Text("molarity", style: TextStyle(color: Colors.black) ),
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
            ),
            body: Center(child: molarityState())
        )
    );
  }
}