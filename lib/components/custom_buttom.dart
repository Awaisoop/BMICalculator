import 'package:bmiproject/components/constants.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({@required this.onTap,@required this.buttomTitle});
  final Function onTap;
  final String  buttomTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttomTitle,style: KlargeSize,)),
        color: KbuttomContainerCLR,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: KbuttomConitanHight,
      ),
    );
  }
}
