import 'package:flutter/material.dart';

class UnitCard extends StatelessWidget {
  const UnitCard({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10, right: 10, bottom: 17),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                label,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
                padding: const EdgeInsets.only(left: 25),
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}
