import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/model/gender_enum.dart';
import 'dart:math';

class BmiProvider extends ChangeNotifier {
  //* I brought all the instances of our data types from the stateful class since we are not using stateful widget
  //* When u want to use provider, always declare your instances inside the class itself
  //*Then u notify available listeners to listen to rebuild to change (using the context.watch)
  //* to listen to an action once (using context.read)
  //* or u can just use consumers has u already did here.
  double result = 0.0;
  String status = '';
  // int weight = 50;
  int weight = 56;
  int height = 120;
  int age = 24;
  Gender gender = Gender.male;

  void chooseGender(Gender gender) {
    if (gender == Gender.male) {
      gender = Gender.male;
      notifyListeners();
    } else {
      gender = Gender.female;
      notifyListeners();
    }
  }

  void weightIncrement() {
    weight++;
    notifyListeners();
  }

  void weightDecrement() {
    weight--;
    notifyListeners();
  }

  void heightIncrement() {
    height++;
    notifyListeners();
  }

  void heightDecrement() {
    height--;
    notifyListeners();
  }

  void ageIncrement() {
    age++;
    notifyListeners();
  }

  void ageDecrement() {
    age--;
    notifyListeners();
  }

  void calculator() {
    result = weight / pow(height / 100, 2);
    notifyListeners();
  }
  // YOu can do this yourself
  void getStatus() {
    if (result <= 18.5) {
      status = 'UnderWeight';
      notifyListeners();
    } else if (result >= 24.9) {
      status = 'Normal';
      notifyListeners();
    } else {
      status = 'Overweight';
      notifyListeners();
    }
    
  }
  //* We are not going to use the void return type here because we want to return the different conditions once 
  //* our result condition is fulfilled, each condition is of the string return type hence the String return type
  //* for the getInterpretation method.
  String getInterpretation() {
    if (result <= 18.5) {
      return 'Please eattttt';
    } else if (result <= 24.9) {
      return 'For your height, a normal weight range would be from 48.6 to 65.3 kg.\n\nYour BMI is $result, indicating your weight is in the $status category for adults of your height.\n\nMaintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.';
    } else {
      return 'Fatso, start exercising';
    }
  }
}
