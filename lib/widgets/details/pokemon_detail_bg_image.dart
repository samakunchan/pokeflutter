import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeflutter/utils/themes.dart';

class PokemonDetailBgImage extends StatelessWidget {
  const PokemonDetailBgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Opacity(
            opacity: .2,
            child: SizedBox(
              child: SvgPicture.asset(
                width: 250,
                '$svgPath/pokeball-bg.svg',
                key: ValueKey('Pokeball Background'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
