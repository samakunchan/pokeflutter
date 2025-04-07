import 'package:flutter/material.dart';
import 'package:pokeflutter/core/models/pokemon_collection_model.dart';
import 'package:pokeflutter/utils/themes.dart';
import 'package:pokeflutter/widgets/home/pokemon_card.dart';

class PokemonGrid extends StatelessWidget {
  const PokemonGrid({required this.pokemons, super.key});
  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        decoration: appDecoration(radius: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                  pokemons.length,
                  (int index) => PokemonCard(pokemon: pokemons[index]),
                ),
              )),
        ),
      ),
    );
  }
}
