import 'package:flutter/material.dart';
import 'package:sci_conv/main.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Contact",
        home: Scaffold(
          appBar: AppBar(
            title: Text("CONTACT", style: TextStyle(color: Colors.black)),
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> MyApp())
                );
              },
              child: Icon(Icons.arrow_back, color: Colors.black,),
            ),
          ),
          body: Container(child:intro()),
        ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget intro(){
    final scalefactor = 1.5;
    final heightfactor = 2.0;
    return Column(children: <Widget>[
        Center(child: Text(
          "기획/마케팅", textScaleFactor: scalefactor,style: TextStyle(fontWeight: FontWeight.w700),
          ),
          heightFactor: heightfactor,
        ),
        Center(child: Text("taegeun3115@hanmail.net", textScaleFactor: scalefactor,), heightFactor: heightfactor),
        Center(child: Text("여러분들의 소중한 후원 기다립니다❤"), heightFactor: heightfactor,),
        SizedBox(height: 30),
        Center(child: Text(
            "개발", textScaleFactor: scalefactor,style: TextStyle(fontWeight: FontWeight.w700)
            ),
            heightFactor: heightfactor),
        Center(child: Text("funlucky373@gmail.com", textScaleFactor: scalefactor), heightFactor: heightfactor),
        Center(child: Text("전세계의 공돌이를 응원합니다"), heightFactor: heightfactor,),
        SizedBox(height: 70),
        Center(child: Text("Powered by Flutter"))
    ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
    );
  }
}
