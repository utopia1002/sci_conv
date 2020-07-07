import 'package:flutter/material.dart';
import 'package:sci_conv/input_conv/inputConvBase.dart';

class inputHelper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'helper',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap:(){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> inputConvertor()));
              },
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: Text("How to Use", style: TextStyle(color: Colors.black) ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
          ),
          body: Column(children: <Widget>[
            Center(child:Text("aA + bB = cC", textScaleFactor: 2,),heightFactor: 1),
            Center(child:Text("A를 xg 넣을 때 필요한 B의 투입량을 계산합니다",
              style: TextStyle(fontWeight: FontWeight.bold),),heightFactor: 2),
            Text("aA : Basis Component", style: TextStyle(color:Colors.blue), textScaleFactor: 1.5,),
            Text("투입용량 : 기준이 될 A의 투입용량",style: TextStyle(color:Colors.blue),textScaleFactor: 1.5,),
            Text("반응계수 : 기준이 될 A의 반응계수",style: TextStyle(color:Colors.blue),textScaleFactor: 1.5,),
            Text("분자량 : 기준일 될 A의 분자량",style: TextStyle(color:Colors.blue),textScaleFactor: 1.5,),
            Text(""),
            Text("bB : Result Component", style: TextStyle(color:Colors.red),textScaleFactor: 1.5,),
            Text("반응계수 : 구해야 하는 B의 반응계수", style: TextStyle(color:Colors.red),textScaleFactor: 1.5,),
            Text("분자량 : 구해야 하는 B의 분자량", style: TextStyle(color:Colors.red),textScaleFactor: 1.5,),
            Text(""),
            Text("값을 입력 후 화살표를 탭하세요", style: TextStyle(color:Colors.black),textScaleFactor: 1.5,)
          ],mainAxisAlignment: MainAxisAlignment.center,)
        )
    );
  }
}