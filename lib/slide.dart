import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:sci_conv/input_conv/inputConvBase.dart';
import 'package:sci_conv/molality/molality_base.dart';
import 'package:sci_conv/molarity/molarity_base.dart';
import 'package:sci_conv/calc/calc_base.dart';
import 'package:sci_conv/conversion/conversionBase.dart';
import 'package:sci_conv/contact.dart';

class sliderState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _sliderState();
}

class _sliderState extends State<sliderState>{
  @override
  Widget build(BuildContext context){
    return slider();
  }


  Widget buttonBox(color, content, textcolor, router){
    return
      FlatButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.black)
        ),
        child: SizedBox(
            width: 200,
            height: 30,
            child: Center(child:
            Text(content, textScaleFactor: 1.5, style: TextStyle(color:textcolor))
            ),
        ),
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => router
              )
          );
        },
      );
  }

  Widget slider(){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            InkWellButton('lib/assets/smallM.jpg', molalityBase(), '몰랄농도'),
            InkWellButton('lib/assets/largeM.jpg', molarityBase(), '몰농도'),
            InkWellButton('lib/assets/Cimage.jpg', calcBase(), '계산기'),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            InkWellButton('lib/assets/inout.jpg', inputConvertor(),'용액 투입량'),
            InkWellButton('lib/assets/arrow.jpg', conversion_base(),'단위환산'),
            InkWellButton('lib/assets/support.jpg', Contact(),'CONTACT'),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }

  Widget InkWellButton(image,router,name){
    return Column(
      children: <Widget>[
        InkWell(
          child: Image.asset(image, width:100, height: 100),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => router)
            );
          },
        ),
        Text(name),
      ],
    );
  }
}