import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Card extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final Color color;

  const Card({@required this.child, @required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
