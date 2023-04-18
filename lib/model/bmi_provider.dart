import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/model/calculator.dart';
import 'package:my_bmi_calculator/model/gender_enum.dart';
import 'dart:math';
import 'package:provider/provider.dart';

class BmiProvider extends ChangeNotifier {
  int weight = 9;
  int height = 120;
  int age = 78;
  double result = 0.0;
  String status = '';

  void chooseGender(Gender gender) {
    gender;
    notifyListeners();
  }

  void increment(int values) {
    if (values == weight) {
      weight++;
    } else if (values == height) {
      height++;
    } else if (values == age) {
      age++;
    }
    values++;
    notifyListeners();
  }

  void decrement(int values) {
    if (values == weight) {
      weight--;
    } else if (values == height) {
      height--;
    } else if (values == age) {
      age--;
    }
    values++;
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
