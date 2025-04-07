import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeflutter/core/models/pokemon_detail.dart';
import 'package:pokeflutter/utils/extension.dart';
import 'package:pokeflutter/utils/themes.dart';

class PokemonDetailInfos extends StatelessWidget {
  const PokemonDetailInfos({required this.pokemonDetail, super.key});

  final PokemonDetail pokemonDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width * .9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 18,
                      child: SvgPicture.asset(key: ValueKey('$svgPath/weight.svg'), '$svgPath/weight.svg'),
                    ),
                    Text('${(pokemonDetail.weight / 10).toString()}kg'),
                  ],
                ),
              ),
              Expanded(child: Text('Weight')),
            ],
          ),
          VerticalDivider(),
          Column(
            spacing: 10,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 18,
                      child: SvgPicture.asset(key: ValueKey('$svgPath/ruler.svg'), '$svgPath/ruler.svg'),
                    ),
                    Text('${(pokemonDetail.height / 10).toString()} m'),
                  ],
                ),
              ),
              Expanded(child: Text('Height')),
            ],
          ),
          VerticalDivider(),
          Column(
            spacing: 10,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pokemonDetail.moves
                          .sublist(0, 2)
                          .map(
                            (detail) => Text(
                              detail.move.name.ucFirst(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(height: 1.2),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              Expanded(child: Text('Moves')),
            ],
          ),
        ],
      ),
    );
  }
}
