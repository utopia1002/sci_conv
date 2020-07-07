import 'package:flutter/material.dart';
import '../input_conv/resource.dart';

class molalityState extends StatefulWidget {
  @override
  _molalityStateBase createState() => _molalityStateBase();
}

class _molalityStateBase extends State<molalityState> {
  final basisQuantity = TextEditingController();
  final basisMass = TextEditingController();
  final basisSolvent = TextEditingController();
  double molality;

  Widget build(BuildContext context) {
    return basisMolality();
  }

  Widget basisMolality() {
    return Center(
      child: ListView(
        children: <Widget>[
          basis(),
          arrow(),
          valueContainor()
        ],
      ),
    );
  }

  Widget basis(){
    return Column(
      children: <Widget>[
        ingredientLabel("기준값"),
        compositeQForm("투입량(g)", basisQuantity),
        compositeQForm("분자량(g/mol)", basisMass),
        compositeQForm("용매량(g)", basisSolvent),
      ],
    );
  }

  Widget arrow() {
    return IconButton(
      icon: Icon(
        Icons.arrow_downward,
        size: 50,
        color: Colors.deepOrangeAccent,
      ),
      onPressed: () {
        convert();
      },
      alignment: Alignment.center
    );
  }

  void convert() {
    double valConv(TextEditingController textVal) {
      return double.parse(textVal.text);
    }

    molality = valConv(basisQuantity) /
        valConv(basisMass) /
        valConv(basisSolvent)
        * 1000;

    setState(() {});
  }

  Widget checker(){
    if(molality==null){
      return Text("몰랄농도= N/A mol/kg", textScaleFactor: 2,);
    }
    else{
      return Text("몰랄농도= $molality mol/kg", textScaleFactor: 2,);
    }
  }

  Widget valueContainor() {
    return Center(
      child: Container(
        child:
          checker(),
        margin: EdgeInsets.symmetric(vertical: 40),
      ),
    );
  }
}
