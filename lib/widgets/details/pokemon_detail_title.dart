import 'package:flutter/material.dart';
import 'package:pokeflutter/utils/text_styles.dart';

class PokemonDetailTitle extends StatelessWidget {
  const PokemonDetailTitle({required this.title, required this.bgColor, super.key});
  final String title;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: kSubTitle1.copyWith(color: bgColor),
        )
      ],
    );
  }
}
