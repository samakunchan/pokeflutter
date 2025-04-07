import 'package:flutter/material.dart';
import 'package:pokeflutter/utils/themes.dart';

class ShapeElevatedButton extends StatelessWidget {
  const ShapeElevatedButton({required this.onPressed, required this.child, super.key});

  final Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: appDecoration(radius: 30),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: child,
        ),
      ),
    );
  }
}
