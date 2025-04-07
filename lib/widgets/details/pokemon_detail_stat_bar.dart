import 'package:flutter/material.dart';

class PokemonDetailStatBar extends StatefulWidget {
  const PokemonDetailStatBar({required this.bgColor, required this.value, super.key});
  final Color bgColor;

  /// La valeur doit être en 0 et 1.
  final double value;

  @override
  State<PokemonDetailStatBar> createState() => _PokemonDetailStatBarState();
}

class _PokemonDetailStatBarState extends State<PokemonDetailStatBar> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..animateTo(widget.value);

    return SizedBox(
      width: MediaQuery.of(context).size.width * .6,
      child: AnimatedBuilder(
        builder: (_, __) {
          return LinearProgressIndicator(
            borderRadius: BorderRadius.circular(50),
            value: controller.value,
            valueColor: AlwaysStoppedAnimation<Color>(widget.bgColor),
            backgroundColor: widget.bgColor.withValues(alpha: .5),
          );
        },
        animation: controller,
      ),
    );
  }
}
