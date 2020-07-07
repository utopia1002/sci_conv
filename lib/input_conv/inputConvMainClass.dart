import 'package:flutter/material.dart';
import 'package:sci_conv/input_conv/resource.dart';

class MainClass extends StatefulWidget{
  @override
  _mainClass createState() => _mainClass();
}

class _mainClass extends State<MainClass>{
  final basisQuantity = TextEditingController();
  final basisCoefficient = TextEditingController();
  final basisMass = TextEditingController();
  final resultCoefficient = TextEditingController();
  final resultMass = TextEditingController();
  var resultValue = 0.0;
  double basisMole = 0;
  double resultMole = 0;

  Widget build(BuildContext context){
    return Center(
      child: ListView(
        children: [
          basisConv(),
          finalConv(),
          arrow(),
          result(),
        ],
      ),
    );
  }

  Widget basisConv(){
    return Column(
      children: <Widget>[
        ingredientLabel("Basis Composite"),
        compositeQForm("투입용량(무게 g)", basisQuantity),
        compositeQForm("반응계수", basisCoefficient),
        compositeQForm("분자량(g/mol)", basisMass),
      ],

    );
  }

  Widget finalConv(){
    return Column(
      children: <Widget>[
        ingredientLabel("Result Composite"),
        compositeQForm("반응계수", resultCoefficient),
        compositeQForm("분자량(g/mol)", resultMass)
      ],
    );
  }

  Widget result(){
    return
      Column(
        children: <Widget>[
          Text(
              "투입해야 하는 양: $resultValue g",
              style:TextStyle(fontSize: 20)
          ),
          Text(
            "기준: $basisMole 몰 → 투입: $resultMole 몰"
          )
        ],
      );
  }

  Widget arrow(){
    double valConv(TextEditingController textVal){
      return double.parse(textVal.text);
    }
    return Row(
      children: <Widget>[
        Text("(탭하여 변환)"),
        Container(
          child: IconButton(
              icon: Icon(Icons.arrow_downward, color: Colors.indigoAccent),
              onPressed: () {
                resultValue = 0;
                resultValue =
                    valConv(basisQuantity)/(valConv(basisMass)*valConv(basisCoefficient))*
                        valConv(resultMass)*valConv(resultCoefficient);
                basisMole = valConv(basisQuantity)/valConv(basisMass);
                resultMole = resultValue/valConv(resultMass);
                setState((){});
              }
          ),
          height: 70,
          width: 70,
          margin: EdgeInsets.symmetric(vertical: 0),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}