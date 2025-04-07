import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeflutter/core/export.dart';
import 'package:pokeflutter/utils/export.dart';
import 'package:pokeflutter/widgets/home/export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> pokemons = List.empty(growable: true);
  List<Pokemon> filteredPokemons = List.empty(growable: true);
  String searchText = '';
  SortEnum? sortSelected = SortEnum.none;
  late List<Pokemon> results;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kThemeData,
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                spacing: 10,
                children: [
                  TitleHeader(),
                  FutureBuilder(
                    future: PokemonService.fetchPokemons(),
                    builder: (BuildContext context, AsyncSnapshot<PokeAPIResponse> snapshot) {
                      final bool isSearchName = snapshot.hasData && searchText.contains('#');
                      final bool isSearchIdParsed = snapshot.hasData && !searchText.contains('#');

                      if (snapshot.hasData) {
                        if (sortSelected == SortEnum.none) {
                          results = snapshot.requireData.results;
                        } else if (sortSelected == SortEnum.name) {
                          snapshot.requireData.results.sort((Pokemon a, Pokemon b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
                          results = snapshot.requireData.results;
                        } else if (sortSelected == SortEnum.number) {
                          snapshot.requireData.results.sort((Pokemon a, Pokemon b) => int.parse(a.id!).compareTo(int.parse(b.id!)));
                          results = snapshot.requireData.results;
                        }

                        if (searchText.isEmpty) {
                          pokemons = results;
                        }

                        if (isSearchName) {
                          pokemons = results.where(nameMatchSearchText).toList();
                        }

                        if (isSearchIdParsed) {
                          pokemons = results.where(idParsedMatchSearchText).toList();
                        }
                      }

                      return Expanded(
                        child: SizedBox(
                          height: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  /// Search
                                  SearchBarPokemon(
                                    onChanged: (String value) {
                                      setState(() {
                                        searchText = value;
                                      });
                                    },
                                  ),

                                  /// Sort
                                  ShapeElevatedButton(
                                    onPressed: () async {
                                      await showDialog<SortEnum>(
                                        context: context,
                                        builder: (BuildContext context) => SizedBox(
                                          width: 20,
                                          child: AlertDialog(
                                            shape: kShapeCard.copyWith(
                                              borderSide: BorderSide(color: kPrimaryColor),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            backgroundColor: kPrimaryColor,
                                            title: Text('Sort by:', style: kHeadline),
                                            content: StatefulBuilder(
                                              builder: (BuildContext context, StateSetter setStates) {
                                                return Container(
                                                  decoration: appDecoration(radius: 20),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        RadioListTile<SortEnum>(
                                                          title: const Text('Number'),
                                                          value: SortEnum.number,
                                                          groupValue: sortSelected,
                                                          onChanged: (SortEnum? value) {
                                                            setStates(() {
                                                              sortSelected = value!;
                                                              Navigator.pop(context, sortSelected);
                                                            });
                                                          },
                                                        ),
                                                        RadioListTile<SortEnum>(
                                                          title: const Text('Name'),
                                                          value: SortEnum.name,
                                                          groupValue: sortSelected,
                                                          onChanged: (SortEnum? value) {
                                                            setStates(() {
                                                              sortSelected = value!;
                                                              Navigator.pop(context, sortSelected);
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            insetPadding: EdgeInsets.all(100),
                                          ),
                                        ),
                                      ).then((_) {
                                        setState(() {});
                                      });
                                    },
                                    child: sortSelected == SortEnum.none
                                        ? SvgPicture.asset(
                                            key: ValueKey('$svgPath/sort-stand-by-icon.svg'), '$svgPath/sort-stand-by-icon.svg')
                                        : sortSelected == SortEnum.name
                                            ? SvgPicture.asset(key: ValueKey('$svgPath/sort-name-icon.svg'), '$svgPath/sort-name-icon.svg')
                                            : SvgPicture.asset(
                                                key: ValueKey('$svgPath/sort-number-icon.svg'), '$svgPath/sort-number-icon.svg'),
                                  ),
                                ],
                              ),

                              /// Body List Pokemon
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  decoration: appDecoration(radius: 10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: ((isSearchName || isSearchIdParsed) && pokemons.isNotEmpty)
                                          ? GridView.builder(
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                              itemCount: pokemons.length,
                                              itemBuilder: (BuildContext context, int index) => RepaintBoundary(
                                                child: PokemonCard(
                                                  key: ValueKey<String>(pokemons[index].name),
                                                  pokemon: pokemons[index],
                                                ),
                                              ),
                                            )
                                          : Center(
                                              child: Text('No Pokemon found'),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool idParsedMatchSearchText(Pokemon pok) => RegExp(searchText).hasMatch(pok.name);

  bool nameMatchSearchText(Pokemon pok) => RegExp(searchText).hasMatch('#${pok.idParsed!}');

  simpleDialog() {
    return SimpleDialog(
      title: Text('Sort by:', style: kHeadline, textAlign: TextAlign.center),
      insetPadding: EdgeInsets.all(100),
      backgroundColor: kPrimaryColor,
      shape: kShapeCard.copyWith(borderSide: BorderSide(color: kPrimaryColor)),
      children: <Widget>[
        RadioListTile(
          title: Text('Number'),
          value: '1',
          groupValue: 'groupValue',
          onChanged: (onChanged) {},
        ),
        RadioListTile(
          title: Text('Name'),
          value: '1',
          groupValue: 'groupValue',
          onChanged: (onChanged) {},
        ),
      ],
    );
  }
}
