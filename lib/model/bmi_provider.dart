import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/model/calculator.dart';
import 'package:my_bmi_calculator/model/gender_enum.dart';
import 'dart:math';
import 'package:provider/provider.dart';

class BmiProvider extends ChangeNotifier {
  int weight = 60;
  int height = 120;
  int age = 24;
  double result = 20.0;
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

  String calculator() {
    result = weight / pow(height / 100, 2);
    return result.toStringAsFixed(2);
    notifyListeners();
  }

  String getStatus() {
    if (result <= 18.5) {
      status = 'UnderWeight';
    } else if (result >= 24.9) {
      status = 'Normal';
    } else {
      status = 'Overweight';
    }
    return status;
  }

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
