import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/component/unit_card.dart';
import 'package:my_bmi_calculator/model/bmi_provider.dart';
import 'package:my_bmi_calculator/model/calculator.dart';
import 'package:my_bmi_calculator/model/gender_enum.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bmi_calculator/screens/result_page.dart';
import 'package:provider/provider.dart';

import '../component/gender_card.dart';
import '../component/input_card.dart';
import '../component/reuse_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cardColor = const Color.fromARGB(255, 57, 58, 71);
  final labelColor = Color.fromARGB(255, 219, 219, 220);
  final greenColor = const Color.fromARGB(255, 5, 148, 83);
  Gender? gender;

  int weight = 56;
  int height = 120;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    Color maleColor = gender == Gender.male ? greenColor : cardColor;
    Color femaleColor = gender == Gender.female ? greenColor : cardColor;
    return Consumer<BmiProvider>(builder: ((context, value, child) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sort),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.bell),
              ),
            ],
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: const Text(
                    'BMI Calculator',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Gender',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: labelColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: ReuseCard(
                          onTap: () {
                            const gender = Gender.male;
                            value.chooseGender(gender);
                          },
                          color: cardColor,
                          borderColor: maleColor,
                          child: const GenderCard(
                              icon: FontAwesomeIcons.person, label: 'Male'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: ReuseCard(
                          onTap: () {
                            value.chooseGender(Gender.female);
                          },
                          color: cardColor,
                          borderColor: femaleColor,
                          child: const GenderCard(
                              icon: FontAwesomeIcons.personDress,
                              label: 'Female'),
                        ),
                      ),
                    ),
                  ],
                ),
                InputCard(
                  labelColor: labelColor,
                  label: 'Weight',
                  unit: const UnitCard(label: 'kg'),
                  value: weight,
                  onTapPlus: () {
                    context.read<BmiProvider>().increment();
                  },
                  onTapMinus: () {
                    context.read<BmiProvider>().decrement(weight);
                  },
                ),
                InputCard(
                  labelColor: labelColor,
                  label: 'Height',
                  unit: const UnitCard(label: 'cm'),
                  value: height,
                  onTapPlus: () {
                    context.read<BmiProvider>().increment();
                  },
                  onTapMinus: () {
                    context.read<BmiProvider>().decrement(height);
                  },
                ),
                InputCard(
                  labelColor: labelColor,
                  label: 'Age',
                  value: age,
                  onTapPlus: () {
                    context.read<BmiProvider>().increment();
                  },
                  onTapMinus: () {
                    context.read<BmiProvider>().decrement(age);
                  },
                ),
                Consumer<BmiProvider>(builder: (context, value, child) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: greenColor,
                    ),
                    child: TextButton(
                      child: const Text(
                        'Calculate',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      onPressed: () {
                        // // final bmi = CalculateBmi(weight, height);
                        // // context.read<BmiProvider>().calculator(bmi);
                        // final bmi = CalculateBmi(weight, height);
                        // final result = value.calculator(bmi);

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ResultPage(
                        //       bmiResult: context.read<BmiProvider>().calculator(bmi),
                        //       interpretation: value.getInterpretation(),
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                  );
                })
              ],
            ),
          ));
    }));
  }
}
