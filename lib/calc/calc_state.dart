import 'package:flutter/material.dart';
import 'src.dart';

class calcState extends StatefulWidget {
  @override
  _calcState createState() => _calcState();
}

class _calcState extends State<calcState> {
  final color_black = Colors.black;
  final color_grey = Colors.grey;
  final color_indigo = Colors.indigo;
  final color_red = Colors.redAccent;

  double currentNum = 0;
  String operator = '';
  double afterNum = 0;
  double result = 0;
  bool dot = false;

  void addNum(String number){
    if(dot == true){
      currentNum = currentNum ~/1 + double.parse(number) * 0.1;
    }
    else{
      if(currentNum.toString().length < 10){
        currentNum = currentNum * 10 + double.parse(number);
      }
      else{
        currentNum = currentNum;
      }
    }
  }

  void remover(){
      currentNum = 0;
      afterNum = 0;
      operator = '';
      result = 0;
      dot = false;
  }

  String panelView(){
    if(afterNum != 0){
      return Rounder(afterNum) + operator +  Rounder(currentNum) + " =";
    }
    else if(operator == ''){
      if(dot==true){
        return currentNum.toString();
      }
      else{
        return Rounder(currentNum);
      }
    }
    else{
      return Rounder(afterNum) + operator + Rounder(currentNum) + " =";
      }
  }

  String Rounder(input){
    if(input==input.roundToDouble()){
      return input.toStringAsFixed(0);
    }
    else{
      return input.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Text(
                  panelView(),
                  textAlign: TextAlign.left,
                  textScaleFactor: 2.0,
                ),
                SizedBox(width: 30,)
              ],
              mainAxisAlignment: MainAxisAlignment.end,

            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Text(
                  Rounder(result),
//                  result.toString(),
                  textAlign: TextAlign.left,
                  textScaleFactor: 2,
                ),
                SizedBox(width: 10,)
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            panel()
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ],
    );
  }

  Widget panel() {
    return Column(
      children: <Widget>[
        SizedBox(height: 80),
        Row(
          children: <Widget>[
            Expanded(child: NumberBox("1", color_black), flex: 1),
            Expanded(child: NumberBox("2", color_black), flex: 1),
            Expanded(child: NumberBox("3", color_black), flex: 1),
            Expanded(child: NumberBox("+", color_grey), flex: 1),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(child: NumberBox("4", color_black), flex: 1),
            Expanded(child: NumberBox("5", color_black), flex: 1),
            Expanded(child: NumberBox("6", color_black), flex: 1),
            Expanded(child: NumberBox("-", color_grey), flex: 1),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(child: NumberBox("7", color_black), flex: 1),
            Expanded(child: NumberBox("8", color_black), flex: 1),
            Expanded(child: NumberBox("9", color_black), flex: 1),
            Expanded(child: NumberBox("X", color_grey), flex: 1),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(child: NumberBox(".", color_grey), flex: 1),
            Expanded(child: NumberBox("0", color_black), flex: 1),
            Expanded(child: NumberBox("-/+", color_grey), flex: 1),
            Expanded(child: NumberBox("/", color_grey), flex: 1),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(child: NumberBox("C", color_red), flex: 1),
            Expanded(child: NumberBox("<", color_grey), flex: 1),
            Expanded(child: NumberBox("=", color_indigo), flex: 2),
          ],
        ),
        SizedBox(height: 80)
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  Widget NumberBox(number, color){
    return Container(
      child: RaisedButton(
        child: Container(child:
        NumberBox_content(number, color),
        ),
        onPressed: (){
          setState(() {
            if(number == "C"){
              remover();
            }
            else if(number == "-/+"){
              currentNum = currentNum * (-1);
            }
            else if(number == "<"){
              if(currentNum*100%100 == 0){
                currentNum = (currentNum ~/ 10).toDouble();
              }
              else{
                currentNum = (currentNum * 10 ~/ 10 / 10);   //소수점 기능 추가시 구현 필요
              }
            }
            else if(number == "."){
                dot = true;
            }
            else if(number == "+" || number == "-" || number == "/" || number == "X"){
              operator = number;
              afterNum = currentNum;
              currentNum = 0;
              dot = false;
              if(result!=0){
                afterNum = result;
              }
            }
            else if(number == "="){
              if(operator == "+"){
                result = currentNum + afterNum;
                result = double.parse(result.toStringAsFixed(2));
              }
              else if(operator == "-"){
                result = afterNum-currentNum;
                result = double.parse(result.toStringAsFixed(2));
              }
              else if(operator == "/"){
                result = afterNum/currentNum;
                result = double.parse(result.toStringAsFixed(2));
              }
              else if(operator == "X"){
                result = afterNum * currentNum;
                result = double.parse(result.toStringAsFixed(2));
              }
            }
            else{
              addNum(number);
            }
          });
        },
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(13),
      ),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
    );
  }
}
