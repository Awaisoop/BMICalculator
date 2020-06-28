

import 'package:bmiproject/calulator_brain.dart';
import 'package:bmiproject/components/custom_buttom.dart';
import 'package:bmiproject/components/icon_content.dart';
import 'package:bmiproject/components/resulabe_card.dart';
import 'package:bmiproject/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/constants.dart';
enum gender{
  male,
  female,

}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         Expanded(child:  Row(
           children: <Widget>[
             Expanded(child: ResulableCard(
               onPress: (){
                 setState(() {
                   selectedGender = gender.male;
                 });
               },
                 colour: selectedGender == gender.male ? KactiveCLR : kinactiveCLR,
                cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),

             ),
             ),
             Expanded(child: ResulableCard(
               onPress: (){
                 setState(() {
                   selectedGender = gender.female;
                 });
               },
               colour: selectedGender == gender.female ? KactiveCLR : kinactiveCLR,
               cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'female',),
             ),),
           ],
         ),),
          Expanded(child:ResulableCard(colour: KactiveCLR,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("HEIGHT",style: KlabelTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    height.toString(),
                    style: Klable2Text,
                  ),
                  Text('cm',style: KlabelTextStyle,),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  onChanged: (double newValue){
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              ),
            ],
          ),

          ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ResulableCard(
                colour:KactiveCLR,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',style: KlabelTextStyle,),
                    Text(
                      weight.toString(),
                      style: Klable2Text,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            weight--;
                          });
                        },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              ),
              Expanded(child:ResulableCard(colour: KactiveCLR,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('AGE',style: KlabelTextStyle,),
                  Text(age.toString(),style: Klable2Text,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: (){
                        setState(() {
                          age--;
                        });
                       },),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                      setState(() {
                        age++;
                      });
                      },),
                    ],
                  )
                ],
              ),

              ),),
            ],
          ),),
          CustomButtom(onTap: (){
              CalulatorBrain calc = CalulatorBrain(hight: height,wieght:weight );
              Navigator.push(context, MaterialPageRoute(builder: (context)=> result_page(
                bmiResult: calc.calculateBMI() ,
                resultText:calc.getResult() ,
                interPrestation: calc.getInterPretation(),
              )));

          },
          buttomTitle: 'CALCULATE',
          )

        ],
      ),
      
    );
  }

}

class RoundIconButton extends StatelessWidget{
  RoundIconButton({this.icon,this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),

      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F6E),
    );
  }

}
