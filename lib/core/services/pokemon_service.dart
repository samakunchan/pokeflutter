import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokeflutter/core/export.dart';

class PokemonService {
  static Future<PokeAPIResponse> fetchPokemons() async {
    final http.Client client = http.Client();
    try {
      final http.Response response = await client.get(
        Uri.https(
          'pokeapi.co',
          '/api/v2/pokemon',
          {'limit': '100'},
        ),
      );
      final Map<String, dynamic> decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      return PokeAPIResponse.fromJson(decodedResponse);
    } finally {
      client.close();
    }
  }

  static Future<PokemonDetail> fetchOnePokemon({required String id}) async {
    final http.Client client = http.Client();
    try {
      final http.Response response = await client.get(
        Uri.https(
          'pokeapi.co',
          '/api/v2/pokemon/$id',
        ),
      );
      final PokemonSpecies pokemonSpecies = await _fetchOnePokemonSpecies(id: id);
      final String rawDescription = pokemonSpecies.pokemonEntries.where((pok) => pok.version.name == 'red').first.flavorText;
      final String description = rawDescription.replaceAll('\n', ' ');
      final Map<String, dynamic> decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      return PokemonDetail.fromJson({...decodedResponse, 'description': description});
    } finally {
      client.close();
    }
  }

  static Future<PokemonSpecies> _fetchOnePokemonSpecies({required String id}) async {
    final http.Client client = http.Client();
    try {
      final http.Response response = await client.get(
        Uri.https(
          'pokeapi.co',
          '/api/v2/pokemon-species/$id',
        ),
      );
      final Map<String, dynamic> decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      return PokemonSpecies.fromJson(decodedResponse);
    } finally {
      client.close();
    }
  }
}
