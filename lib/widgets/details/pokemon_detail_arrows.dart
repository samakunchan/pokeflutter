import 'package:flutter/material.dart';
import 'package:pokeflutter/utils/colors.dart';

class PokemonDetailArrows extends StatelessWidget {
  const PokemonDetailArrows({required this.onPrevious, required this.onNext, super.key});
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onPrevious,
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: kWhiteColor,
                ),
              ),
              IconButton(
                onPressed: onNext,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(flex: 7, child: const SizedBox()),
      ],
    );
  }
}
