import 'package:flutter/material.dart';
import 'package:pokeflutter/core/models/pokemon_detail.dart';
import 'package:pokeflutter/utils/text_styles.dart';
import 'package:pokeflutter/widgets/details/export.dart';

class PokemonDetailStats extends StatelessWidget {
  const PokemonDetailStats({required this.pokemonDetail, required this.bgColor, super.key});

  final PokemonDetail pokemonDetail;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      height: 180,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: pokemonDetail.stats
                .map(
                  (PokemonStats detail) => Text(
                    detail.stat.name.substring(0, 2).toUpperCase(),
                    style: kSubTitle1.copyWith(color: bgColor),
                  ),
                )
                .toList(),
          ),
          VerticalDivider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: pokemonDetail.stats
                .map(
                  (PokemonStats detail) => Row(
                    spacing: 10,
                    children: [
                      Text(
                        detail.baseStat.toString().padLeft(3, '0'),
                        style: kSubTitle1.copyWith(fontWeight: FontWeight.normal),
                      ),
                      PokemonDetailStatBar(value: detail.baseStat.toDouble() / 200, bgColor: bgColor),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
