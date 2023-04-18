import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bmi_calculator/model/bmi_provider.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
  });
//* We do not need to pass arguments through this widget since all our dependencies
//* is inside the changenotifier class
  @override
  Widget build(BuildContext context) {
    //* I created an instance of the provoder class
    //* Remember context.watch means the listen property when using Provider.of(context, listen: false) is false
    //* and context.read is vice-versa
    final bmiProvider = context.watch<BmiProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.bell),
          )
        ],
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
            const Center(
              child: Text(
                'Result',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
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
                      bmiProvider.result.toStringAsFixed(2),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
            //* I also called the getInterpretation method 
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    bmiProvider.getInterpretation(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 219, 219, 220),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
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
