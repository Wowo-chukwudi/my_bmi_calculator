import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bmi_calculator/model/bmi_provider.dart';
import 'package:provider/provider.dart';

class InputCard extends StatelessWidget {
  const InputCard(
      {super.key,
      required this.labelColor,
      required this.label,
      this.unit,
      required this.values,
      required this.onTapPlus,
      required this.onTapMinus});

  final Color labelColor;
  final String label;
  final Widget? unit;
  final int values;
  final Function() onTapPlus;
  final Function() onTapMinus;
  //final BmiProvider variables;

  @override
  Widget build(BuildContext context) {
    return Consumer<BmiProvider>(
      builder: ((context, value, child) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: labelColor),
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 10, right: 10, bottom: 17),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: IconButton(
                                onPressed: onTapMinus,
                                icon: const Icon(FontAwesomeIcons.circleMinus),
                                color: Colors.black,
                                iconSize: 18,
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Text(
                                values.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: IconButton(
                                onPressed: onTapPlus,
                                icon: const Icon(FontAwesomeIcons.circlePlus),
                                color: Colors.black,
                                iconSize: 18,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Container(
                    child: unit,
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
