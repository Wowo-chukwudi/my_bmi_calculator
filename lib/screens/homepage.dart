import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/component/color_cards.dart';
import 'package:my_bmi_calculator/component/gender_card.dart';
import 'package:my_bmi_calculator/component/input_card.dart';
import 'package:my_bmi_calculator/component/reuse_card.dart';
import 'package:my_bmi_calculator/component/unit_card.dart';
import 'package:my_bmi_calculator/model/bmi_provider.dart';
import 'package:my_bmi_calculator/model/gender_enum.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bmi_calculator/screens/result_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //* I created an instance the gender enum so that i can use it for this color logic here and also
    //* To populate the places where i need an instance of the gender enum
    final gender = context.watch<BmiProvider>().gender;
    Color maleColor = gender == Gender.male ? greenColor : cardColor;
    Color femaleColor = gender == Gender.female ? greenColor : cardColor;
    return Consumer<BmiProvider>(
      builder: ((context, value, child) {
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
            padding: const EdgeInsets.only(
              top: 20,
              left: 30,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: const Text(
                    'BMI Calculator',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Gender',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: labelColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: ReuseCard(
                          onTap: () {
                            value.gender = Gender.male;
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
                            value.gender = Gender.female;
                            value.chooseGender(gender);
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
                  value: value.weight,
                  onTapPlus: () {
                    value.weightIncrement();
                  },
                  onTapMinus: () {
                    value.weightDecrement();
                  },
                ),
                InputCard(
                  labelColor: labelColor,
                  label: 'Height',
                  unit: const UnitCard(label: 'cm'),
                  value: value.height,
                  onTapPlus: () {
                    value.heightIncrement();
                  },
                  onTapMinus: () {
                    value.heightDecrement();
                  },
                ),
                InputCard(
                  labelColor: labelColor,
                  label: 'Age',
                  value: value.age,
                  onTapPlus: () {
                    value.ageIncrement();
                  },
                  onTapMinus: () {
                    value.ageDecrement();
                  },
                ),
                Container(
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
                      value.calculator();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultPage(),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
