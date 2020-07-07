import 'package:flutter/material.dart';

//input form widget
Widget inputForm(String i, controller){
  return Container(
    child: TextFormField(
      decoration:  InputDecoration(
        hintText: i,
        labelText: i,
      ),
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
    ),
    constraints: BoxConstraints(minWidth: 100, minHeight: 10),
    width: 100,
    height: 55,
  );
}
//단위 환산 기준(convertor 에서 사용)
convertorDetail(String start) {
  var unselected = {'n/a': ''};
  //1m 기준
  var length = {
    'm': 1.0,
    'mm': 1000.0,
    'cm': 100.0,
    'km': 0.001,
    'in': 39.370079,
    'ft': 3.28084,
    'yd': 1.093613,
    'mile': 0.000621
  };
  //1m2 기준
  var area = {
    'm^2': 1.0,
    'cm^2': 10000.0,
    'a': 0.01,
    'ha': 0.001,
    'km^2': 1000000.0,
    'ft^2': 10.76391,
    'syd': 1.19599
  };
  //1L 기준
  var volume = {
    'l': 1.0,
    'cc': 1000.0,
    'ml': 1000.0,
    'dl': 10.0,
    'cm^3': 1000.0,
    'm^3': 0.001,
    'in^3': 61.023744,
    'ft^3': 0.035315,
    'yd^3': 0.001308,
    'gal': 0.264172,
    'bbl': 0.006293,
    'oz': 33.814022
  };
  //1kg 기준
  var weight = {
    'kg': 1.0,
    'g': 1000.0,
    'mg': 1000000.0,
    't': 0.001,
    'oz': 35.273962,
    'lb': 2.204623
  };
  //1섭씨도 기준
  var temp = {'C': 1.0, 'F': 33.8, 'K': 274.15};
  //1atm 기준
  var pressure = {
    'atm': 1.0,
    "Pa": 101325.0,
    'hPa': 1013.25,
    'MPa': 0.101325,
    'bar': 1.01325,
    'kgf/cm2': 1.033227,
    'psi': 14.696,
    'mmHg': 760.0,
    'Torr': 760.0,
  };
  if (start == 'length') {
    return length;
  }
  else if (start == "volume") {
    return volume;
  }
  else if (start == "weight") {
    return weight;
  }
  else if (start == "temp") {
    return temp;
  }
  else if (start == "area") {
    return area;
  }
  else if (start == "pressure") {
    return pressure;
  }
  else {
    return unselected;
  }
}
//최종 환산계산 및 온도간 변환
double getResult(input, var Unit, startUnit, resultUnit){
  if(Unit=="temp"){
    if(startUnit=="C"){
      if(resultUnit=="F"){
        print("C->F");
        return input*1.8 + 32;
      }
      else if(resultUnit=="K"){
        return input+273.15;
      }
      else{
        return input;
      }
    }
    else if(startUnit=="F"){
      if(resultUnit=="C"){
        return (input-32)/1.8;
      }
      else if(resultUnit=="K"){
        return (input-32)/1.8+273.15;
      }
      else{
        return input;
      }
    }
    else if(startUnit=="K"){
      if(resultUnit=="C"){
        return input-273.15;
      }
      else if(resultUnit=="F"){
        return (input-273.15)*1.8 + 32;
      }
      else{
        return input;
      }
    }
  }
  else{
    return input/convertorDetail(Unit)[startUnit]*convertorDetail(Unit)[resultUnit];
  }
}
//각 기준별 단위
List convertor(String start){
  List<String> length = ['m', 'mm', 'cm', 'km', 'in', 'ft','yd','mile'];
  List<String> area = ['m^2','cm^2','km^2','a','ha','ft^2'];
  List<String> volume = ['l','cc','ml','dl', 'cm^3','m^3','in^3','ft^3','yd^3','gal',
    'bbl','oz'];
  List<String> weight = ['kg','g','mg','t','oz','lb'];
  List<String> temp = ['C','F','K'];
  List<String> pressure = ['atm','Pa','hPa','MPa','bar','kgf/cm2','psi','mmHg','Torr'];
  List<String> unselected = [''];

  if(start=='length'){
    return length;
  }
  else if(start=="volume"){
    return volume;
  }
  else if(start=="weight"){
    return weight;
  }
  else if(start=="temp"){
    return temp;
  }
  else if(start=="area"){
    return area;
  }
  else if(start=="pressure"){
    return pressure;
  }
  else{
    return unselected;
  }
}