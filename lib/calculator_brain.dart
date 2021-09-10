import 'dart:math';

class CalculatorBrain{
  int weight;
  int height;

  CalculatorBrain(this.weight,this.height);

 late double _bmi;
  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >=25){
      return'Over weight';
    }else if(_bmi>18.5 && _bmi<25){
      return 'Normal';
    }else{
      return 'Under weight';
    }
  }

  String getInterpretation(){
    if(_bmi >=25){
      return'you have a higher than normal body weight. try to exercise more';
    }else if(_bmi>18.5 && _bmi<25){
      return 'you have a normal body weight. Great job!';
    }else{
      return 'you have a lower than normal body weight. you can eat a bit more ';
    }
  }
}