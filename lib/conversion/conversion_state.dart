import 'package:flutter/material.dart';
import 'package:sci_conv/conversion/conversion_resource.dart';

class conversion_state extends StatefulWidget{
  @override
  _conversion_state createState() => _conversion_state();
}

class _conversion_state extends State<conversion_state>{

  String _selectedItem;
  String _selectedDetail;
  String _selectedResult;
  double _resultValue = 0;
  final inputFormC = TextEditingController();

  List<String> units_result;
  List<String> units_start;

  @override
  Widget build(BuildContext context){
    return Center(
        child:Column(
          children: <Widget>[
            SizedBox(height: 20),
            startunit(),
            SizedBox(height: 20),
            Text("START",textScaleFactor: 2,),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                inputForm("변환할 값", inputFormC),
                SizedBox(width: 20),
                detailunit(),
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            SizedBox(height: 30),
            ConvButton(),
            SizedBox(height: 30),
            Text("RESULT",textScaleFactor: 2,),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Text(_resultValue.toStringAsFixed(2)),
                SizedBox(width: 60),
                resultUnit(),
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        )
    );
  }

  Widget startunit(){

    final List<String> units = <String>['이곳을 탭하여 선택해주세요','length','area','volume','weight','temp','pressure'];

    String _setItem(){
      if(_selectedItem==null){
        return units[0];
      }
      else{
        return _selectedItem;
      }
    }

    return DropdownButton(
      isExpanded: true,
      value: _setItem(),
      items: units.map((unit){
          return DropdownMenuItem<String>(
            child: Text(unit),
            value: unit,
          );
      }).toList(),
      selectedItemBuilder: (BuildContext context){
        return units.map((String unit){
          return Center(child: Text(unit));
        }).toList();
      },
      onChanged: (unit){
        setState(() {
          _selectedItem = unit;
          units_result = convertor(_selectedItem);
          units_start = convertor(_selectedItem);
          _selectedResult = units_result[0];
          _selectedDetail = units_start[0];
        });
      },
    );
  }

  Widget detailunit(){

    units_start = convertor(_selectedItem);

    return DropdownButton(
      itemHeight: 66,
      value: _selectedDetail,
      items: units_start.map((unit){
        return DropdownMenuItem<String>(
          child: Text(unit),
          value: unit,
        );
      }).toList(),
      selectedItemBuilder: (BuildContext context){
        return units_start.map((String unit){
          return Center(child: Text(unit));
        }).toList();
      },
      onChanged: (unit){
        setState(() {
          _selectedDetail = unit;
        });
      },
    );
  }

  Widget resultUnit(){

    units_result = convertor(_selectedItem);

    return DropdownButton(
      itemHeight: 66,
      value: _selectedResult,
      items: units_result.map((unit){
        return DropdownMenuItem<String>(
          child: Text(unit),
          value: unit,
        );
      }).toList(),
      selectedItemBuilder: (BuildContext context){
        return units_result.map((String unit){
          return Center(child: Text(unit));
        }).toList();
      },
      onChanged: (unit){
        setState(() {
          _selectedResult = unit;
        });
      },
    );
  }

  Widget ConvButton(){
    double valConv(TextEditingController textVal){
      return double.parse(textVal.text);
    }
    return IconButton(
      icon: Icon(Icons.autorenew),
      color: Colors.deepOrangeAccent,
      iconSize: 48,
      onPressed: (){
        setState((){
          _resultValue = getResult(valConv(inputFormC), _selectedItem, _selectedDetail ,_selectedResult);
        });
      },
    );
  }
}

