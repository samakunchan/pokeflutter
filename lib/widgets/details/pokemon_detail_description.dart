import 'package:flutter/material.dart';

class PokemonDetailDescription extends StatelessWidget {
  const PokemonDetailDescription({this.description = 'La description', super.key});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(description),
        )
      ],
    );
  }
}
