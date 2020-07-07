import 'package:flutter/material.dart';
import '../input_conv/resource.dart';

class molarityState extends StatefulWidget {
  @override
  _molarityStateBase createState() => _molarityStateBase();
}

class _molarityStateBase extends State<molarityState> {
  final basisQuantity = TextEditingController();
  final basisMass = TextEditingController();
  final basisSolvent = TextEditingController();
  double molarity;

  Widget build(BuildContext context) {
    return basisMolarity();
  }

  Widget basisMolarity() {
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
        compositeQForm("용질량(g)", basisQuantity),
        compositeQForm("용질의 분자량(g/mol)", basisMass),
        compositeQForm("전체 용액량(mL)", basisSolvent),
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

    molarity = valConv(basisQuantity) /
        valConv(basisMass) /
        valConv(basisSolvent) *
        1000;

    setState(() {});
  }

  Widget checker(){
    if(molarity==null){
      return Text("몰농도= N/A mol/L", textScaleFactor: 2,);
    }
    else{
      return Text("몰농도= $molarity mol/L", textScaleFactor: 2,);
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
