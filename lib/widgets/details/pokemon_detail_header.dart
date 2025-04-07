import 'package:flutter/material.dart';
import 'package:pokeflutter/utils/colors.dart';
import 'package:pokeflutter/utils/extension.dart';
import 'package:pokeflutter/utils/text_styles.dart';
import 'package:pokeflutter/utils/themes.dart';

class PokemonDetailHeader extends StatelessWidget {
  const PokemonDetailHeader({
    required this.name,
    required this.idParsed,
    required this.onTap,
    super.key,
  });
  final String name;
  final String idParsed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 20,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Image.asset(key: ValueKey('$pngPath/arrow-back.png'), '$pngPath/arrow-back.png'),
              ),
              Text(name.ucFirst(), style: kHeadline),
            ],
          ),
          Text('#$idParsed', style: kSubTitle2.copyWith(color: kWhiteColor)),
        ],
      ),
    );
  }
}
