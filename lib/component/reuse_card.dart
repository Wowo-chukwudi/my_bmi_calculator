import 'package:flutter/material.dart';

class ReuseCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Color borderColor;
  final Function() onTap;

  const ReuseCard(
      {super.key,
      required this.color,
      required this.child,
      required this.borderColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 5, bottom: 30, right: 10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor, width: 3.0)),
        child: child,
      ),
    );
  }
}
