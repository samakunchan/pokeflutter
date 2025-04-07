class PokeAPIResponse {
  const PokeAPIResponse({required this.count, required this.results, this.next, this.previous});

  final int count;
  final String? next;
  final String? previous;
  final List<Pokemon> results;

  factory PokeAPIResponse.fromJson(Map<String, dynamic> json) {
    return PokeAPIResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List).map((res) => Pokemon.fromJson(res as Map<String, dynamic>)).toList(),
    );
  }
}

class Pokemon {
  const Pokemon({required this.name, required this.url, this.id, this.idParsed});
  final String name;
  final String url;
  final String? id;
  final String? idParsed;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
      id: _getPokemonIdFromUrl(json['url']),
      idParsed: _parsePokemonId(json['url']),
    );
  }

  static String _getPokemonIdFromUrl(String url) {
    return url.split('/').where((text) => text.isNotEmpty).last;
  }

  static String _parsePokemonId(String url) {
    final String id = _getPokemonIdFromUrl(url);
    if (!int.parse(id).isNaN) {
      return id.padLeft(3, '0');
    } else {
      return 'NaN';
    }
  }
}

// {count: 1304, next: https://pokeapi.co/api/v2/pokemon?offset=21&limit=21, previous: null, results: [{name: bulbasaur, url: https://pokeapi.co/api/v2/pokemon/1/}, {name: ivysaur, url: https://pokeapi.co/api/v2/pokemon/2/}, {name: venusaur, url: https://pokeapi.co/api/v2/pokemon/3/}, {name: charmander, url: https://pokeapi.co/api/v2/pokemon/4/}, {name: charmeleon, url: https://pokeapi.co/api/v2/pokemon/5/}, {name: charizard, url: https://pokeapi.co/api/v2/pokemon/6/}, {name: squirtle, url: https://pokeapi.co/api/v2/pokemon/7/}, {name: wartortle, url: https://pokeapi.co/api/v2/pokemon/8/}, {name: blastoise, url: https://pokeapi.co/api/v2/pokemon/9/}, {name: caterpie, url: https://pokeapi.co/api/v2/pokemon/10/}, {name: metapod, url: https://pokeapi.co/api/v2/pokemon/11/}, {name: butterfree, url: https://pokeapi.co/api/v2/pokemon/12/}, {name: weedle, url: https://pokeapi.co/api/v2/pokemon/13/}, {name: kakuna, url: https://pokeapi.co/api/v2/pokemon/14/}, {name: beedrill, url: https://pokeapi<…>
