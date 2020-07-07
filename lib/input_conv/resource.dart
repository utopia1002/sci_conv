import 'package:flutter/material.dart';

Widget ingredientLabel(name) {
  return Container(child:
  Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      margin: EdgeInsets.symmetric(vertical: 15)
  );
}

Widget compositeQForm(String i, controller){
  return Container(
    child: TextFormField(
      decoration:  InputDecoration(
          hintText: i,
          labelText: i,
      ),
      controller: controller,
      keyboardType: TextInputType.number,
    ),
    constraints: BoxConstraints(minWidth: 300, minHeight: 20),
    width: 300,
  );
}

Widget ingredientAtomsInput() {
  return Row(children: <Widget>[
    atomsNumberBox("C"),
    atomsNumberBox("H"),
    atomsNumberBox("O"),
    atomsNumberBox("N"),
  ],
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceAround,);
}

Widget atomsNumberBox(String atom) {
  return Container(
      width: 50,
      constraints: BoxConstraints(minHeight: 20, minWidth: 20),
      child: atomsNumberForm(atom)
  );
}

Widget atomsNumberForm(String atom) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: atom,
      labelText: atom,
    ),
    keyboardType: TextInputType.number,
  );
}