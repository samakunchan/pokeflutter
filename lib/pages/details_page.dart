import 'package:flutter/material.dart';
import 'package:pokeflutter/core/export.dart';
import 'package:pokeflutter/utils/export.dart';
import 'package:pokeflutter/widgets/details/export.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({required this.pokemonDetail, super.key});
  final PokemonDetail pokemonDetail;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final PageController controller;

  late PokemonDetail previousPokemonDetail;
  late PokemonDetail currentPokemonDetail;
  late PokemonDetail nextPokemonDetail;

  @override
  void initState() {
    currentPokemonDetail = widget.pokemonDetail;
    loadPreviousAndNextPokemons(currentPokemonDetail);
    controller = PageController(initialPage: currentPokemonDetail.id - 1);

    super.initState();
  }

  Future<void> loadPreviousAndNextPokemons(PokemonDetail detail) async {
    final int previousId = detail.id <= 1 ? 1 : (detail.id - 1);
    previousPokemonDetail = await PokemonService.fetchOnePokemon(id: previousId.toString());
    nextPokemonDetail = await PokemonService.fetchOnePokemon(id: (detail.id + 1).toString());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor = getType(currentPokemonDetail.types.first.type.name.ucFirst());

    return PageView.builder(
      controller: controller,
      onPageChanged: (int index) async {
        /// Previous
        if (currentPokemonDetail.id > (index + 1)) {
          setState(() {
            currentPokemonDetail = previousPokemonDetail;
          });
        }

        /// Next
        if (currentPokemonDetail.id < (index + 1)) {
          setState(() {
            currentPokemonDetail = nextPokemonDetail;
            previousPokemonDetail = previousPokemonDetail;
          });
        }
        loadPreviousAndNextPokemons(currentPokemonDetail);
      },
      itemBuilder: (_, int index) {
        return MaterialApp(
          theme: kThemeData.copyWith(primaryColor: bgColor, scaffoldBackgroundColor: bgColor),
          home: Scaffold(
            body: Stack(
              children: [
                PokemonDetailBgImage(),
                SafeArea(
                  child: Stack(
                    children: [
                      /// BG + Body
                      Column(
                        children: [
                          Spacer(flex: 3),
                          Expanded(
                            flex: 7,
                            child: Container(
                              decoration: appDecoration(color: bgColor, radius: 10),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 70, left: 32, right: 32),
                                child: Column(
                                  spacing: 10,
                                  children: [
                                    PokemonDetailBadge(pokemonDetail: currentPokemonDetail),

                                    /// About
                                    PokemonDetailTitle(title: 'About', bgColor: bgColor),

                                    /// Pokemon infos
                                    PokemonDetailInfos(pokemonDetail: currentPokemonDetail),

                                    /// Description
                                    PokemonDetailDescription(description: currentPokemonDetail.description),

                                    /// Base stats
                                    PokemonDetailTitle(title: 'Base Stats', bgColor: bgColor),
                                    PokemonDetailStats(pokemonDetail: currentPokemonDetail, bgColor: bgColor),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      /// Image + Action buttons
                      Stack(
                        children: [
                          /// Header
                          PokemonDetailHeader(
                            name: currentPokemonDetail.name,
                            idParsed: currentPokemonDetail.id.toString().padLeft(3, '0'),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),

                          /// Arrows
                          PokemonDetailArrows(
                            onPrevious: () {
                              controller.previousPage(
                                duration: Duration(milliseconds: 200),
                                curve: Easing.emphasizedAccelerate,
                              );
                            },
                            onNext: () {
                              controller.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Easing.emphasizedAccelerate,
                              );
                            },
                          ),
                        ],
                      ),

                      /// Image Pokemon
                      Hero(
                        tag: '$officialArtwork/${currentPokemonDetail.id}.png',
                        child: PokemonDetailImage(pokemonDetail: currentPokemonDetail),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
