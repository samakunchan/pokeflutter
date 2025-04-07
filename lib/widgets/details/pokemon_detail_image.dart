import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokeflutter/core/models/pokemon_detail.dart';
import 'package:pokeflutter/utils/themes.dart';

class PokemonDetailImage extends StatelessWidget {
  const PokemonDetailImage({required this.pokemonDetail, super.key});

  final PokemonDetail pokemonDetail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
          top: Platform.isAndroid ? 70 : 50,
          child: Image.network(
            '$officialArtwork/${pokemonDetail.id}.png',
            width: 250,
            height: 250,
            loadingBuilder: (_, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Image.asset('assets/pngs/placeholder.png');
            },
          ),
        ),
      ],
    );
  }
}
