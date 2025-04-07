import 'package:flutter/material.dart';
import 'package:pokeflutter/core/models/pokemon_detail.dart';
import 'package:pokeflutter/utils/colors.dart';
import 'package:pokeflutter/utils/extension.dart';
import 'package:pokeflutter/utils/text_styles.dart';

class PokemonDetailBadge extends StatelessWidget {
  const PokemonDetailBadge({required this.pokemonDetail, super.key});

  final PokemonDetail pokemonDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: pokemonDetail.types
          .map(
            (PokemonTypes types) => Chip(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: WidgetStatePropertyAll(getType(types.type.name.ucFirst())),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: getType(types.type.name.ucFirst())),
                borderRadius: BorderRadius.circular(20),
              ),
              label: Text(
                types.type.name.ucFirst(),
                style: kSubTitle2.copyWith(color: kWhiteColor),
              ),
            ),
          )
          .toList(),
    );
  }
}
