
import 'package:bmiproject/components/constants.dart';
import 'package:bmiproject/components/custom_buttom.dart';
import 'package:bmiproject/components/resulabe_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class result_page extends StatelessWidget{
  result_page({@required this.bmiResult, @required this.resultText,@required this.interPrestation});
  final String bmiResult;
  final String resultText;
  final String interPrestation;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text('BMI CALCULATOR'),
     ),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget>[
         Expanded(
           child: Container(
             padding: EdgeInsets.all(15.0),
             alignment: Alignment.bottomLeft,
             child: Text('Your Result',style: KtitleText,),
           ),
         ),
         Expanded(
           flex: 5,
           child: ResulableCard(
             colour: KactiveCLR,
             cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Text(resultText.toUpperCase(),style: resultStyle,),
                 Text(
                   bmiResult,
                   style: KbmiTextSTYLE,
                 ),
                 Text(
                  interPrestation,
                    textAlign: TextAlign.center,
                   style: KbodyResult,
                 ),

               ],
             ),

           ),
         ),
        CustomButtom(onTap: (){
          Navigator.pop(context);
        }, buttomTitle:'RE-CALCULATE',
        ),

       ],
     ) ,
   );
  }
  
}