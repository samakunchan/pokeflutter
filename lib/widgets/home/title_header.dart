import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeflutter/utils/text_styles.dart';
import 'package:pokeflutter/utils/themes.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          key: ValueKey('$svgPath/pokeball.svg'),
          '$svgPath/pokeball.svg',
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Pokédex', style: kHeadline),
        ),
      ],
    );
  }
}
