import 'dart:math';
class CalulatorBrain{
 CalulatorBrain({this.hight,this.wieght});
  final int hight;
 final int wieght;
 double _bmi;

  String calculateBMI(){
     _bmi = wieght / pow(hight / 100, 2);
   return _bmi.toStringAsFixed(1);

  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }else if (_bmi > 18.5){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }


  String getInterPretation(){
    if(_bmi >= 25){
      return 'Your have a higher then normal body weight. Try to exercise more.';
    }else if (_bmi > 18.5){
      return 'You have a normal body weight. Good job!';
    }else{
      return 'You have a lower then normal body weight. You can eat a bit more :-).';
    }
  }

}