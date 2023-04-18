import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/model/calculator.dart';
import 'package:my_bmi_calculator/model/gender_enum.dart';
import 'dart:math';
import 'package:provider/provider.dart';

class BmiProvider extends ChangeNotifier {
  double result = 0.0;
  String status = '';
  int weight = 50;

  void chooseGender(Gender gender) {
    if (gender == Gender.male) {
      gender = Gender.male;
    } else {
      gender = Gender.female;
    }
    gender;
    notifyListeners();
  }

  void increment() {
    weight++;

    notifyListeners();
  }

  void decrement(int value) {
    value--;

    notifyListeners();
  }

  void calculator(CalculateBmi value) {
    result = value.weight / pow(value.height / 100, 2);

    notifyListeners();
  }

  void getStatus() {
    if (result <= 18.5) {
      status = 'UnderWeight';
    } else if (result >= 24.9) {
      status = 'Normal';
    } else {
      status = 'Overweight';
    }

    notifyListeners();
  }

  void getInterpretation() {
    if (result <= 18.5) {
      'Please eattttt';
    } else if (result <= 24.9) {
      'For your height, a normal weight range would be from 48.6 to 65.3 kg.\n\nYour BMI is $result, indicating your weight is in the $status category for adults of your height.\n\nMaintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.';
    } else {
      'Fatso, start exercising';
    }
    notifyListeners();
  }
}
