
import 'dart:math';

class CalculatorBrain{

  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI (){
    _bmi = weight / pow(height / 100 , 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults (){
    if(_bmi >= 25){
      return 'Overweight';
    }else if(_bmi >= 18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String interpretate (){
    if(_bmi >= 25){
      return 'High risk of developing heart disease, high blood pressure, stroke, diabetes';
    }else if(_bmi >= 18.5){
      return 'Low Risk (healthy range)';
    }else{
      return 'Risk of developing problems such as nutritional deficiency and osteoporosis';
    }
  }

}