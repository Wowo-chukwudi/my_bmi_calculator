import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bmi_calculator/model/bmi_provider.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key, required this.bmiResult, required this.interpretation});

  final String bmiResult;

  final String interpretation;

  @override
  Widget build(BuildContext context) {
    final bmiProvider = context.watch<BmiProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.bell))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: const Text(
                'Result',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 57, 58, 71),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Your current BMI',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 219, 219, 220),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        bmiResult,
                        style: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w900),
                      )
                    ]),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                interpretation,
                style: const TextStyle(fontSize: 16),
              ),
            )),
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 5, 148, 83),
              ),
              child: TextButton(
                child: const Text(
                  'Recalculate BMI',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
