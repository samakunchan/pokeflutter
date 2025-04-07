class PokemonSpecies {
  const PokemonSpecies({required this.pokemonEntries});
  final List<PokemonSpecyEntry> pokemonEntries;

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) {
    return PokemonSpecies(
      pokemonEntries: (json['flavor_text_entries'] as List).map((json) => PokemonSpecyEntry.fromJson(json)).toList(),
    );
  }
}

class PokemonSpecyEntry {
  const PokemonSpecyEntry({required this.flavorText, required this.language, required this.version});
  final String flavorText;
  final PokemonEntry language;
  final PokemonEntry version;

  factory PokemonSpecyEntry.fromJson(Map<String, dynamic> json) {
    return PokemonSpecyEntry(
      flavorText: json['flavor_text'],
      language: PokemonEntry.fromJson(json['language']),
      version: PokemonEntry.fromJson(json['version']),
    );
  }
}

class PokemonEntry {
  const PokemonEntry({required this.name});
  final String name;

  factory PokemonEntry.fromJson(Map<String, dynamic> json) {
    return PokemonEntry(
      name: json['name'],
    );
  }
}
