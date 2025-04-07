import 'package:flutter/material.dart';
import 'package:pokeflutter/core/models/pokemon_collection_model.dart';
import 'package:pokeflutter/core/models/pokemon_detail.dart';
import 'package:pokeflutter/core/services/pokemon_service.dart';
import 'package:pokeflutter/pages/details_page.dart';
import 'package:pokeflutter/utils/colors.dart';
import 'package:pokeflutter/utils/extension.dart';
import 'package:pokeflutter/utils/text_styles.dart';
import 'package:pokeflutter/utils/themes.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({required this.pokemon, super.key});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final PokemonDetail pokemonDetail = await PokemonService.fetchOnePokemon(id: pokemon.id!);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(pokemonDetail: pokemonDetail),
          ),
        );
      },
      child: Card(
        color: kWhiteColor,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text('#${pokemon.idParsed ?? '000'}', style: kCaption),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                decoration: cardDecoration(),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Hero(
                  tag: '$officialArtwork/${pokemon.id ?? '1'}.png',
                  child: Image.network(
                    '$officialArtwork/${pokemon.id ?? '1'}.png',
                    width: 72,
                    height: 72,
                    loadingBuilder: (_, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Image.asset('assets/pngs/placeholder.png');
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(pokemon.name.ucFirst(), style: kBody3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
