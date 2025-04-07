class PokemonDetail {
  const PokemonDetail({
    required this.moves,
    required this.stats,
    required this.cries,
    required this.types,
    required this.height,
    required this.weight,
    required this.id,
    required this.name,
    this.description = 'No description provided',
  });
  final List<PokemonMoves> moves;
  final List<PokemonStats> stats;
  final PokemonCry cries;
  final List<PokemonTypes> types;
  final int height;
  final int weight;
  final int id;
  final String name;
  final String description;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
      moves: (json['moves'] as List).map((res) => PokemonMoves.fromJson(res)).toList(),
      stats: (json['stats'] as List).map((res) => PokemonStats.fromJson(res)).toList(),
      cries: PokemonCry.fromJson(json['cries']),
      types: (json['types'] as List).map((res) => PokemonTypes.fromJson(res)).toList(),
      height: json['height'],
      weight: json['weight'],
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? 'No description provided',
    );
  }
}

class PokemonMoves {
  const PokemonMoves({required this.move});
  final PokemonMove move;

  factory PokemonMoves.fromJson(Map<String, dynamic> json) {
    return PokemonMoves(
      move: PokemonMove.fromJson(json['move']),
    );
  }
}

class PokemonMove {
  const PokemonMove({required this.name});
  final String name;

  factory PokemonMove.fromJson(Map<String, dynamic> json) {
    return PokemonMove(
      name: json['name'],
    );
  }
}

class PokemonStats {
  const PokemonStats({required this.baseStat, required this.stat});
  final int baseStat;
  final PokemonStat stat;

  factory PokemonStats.fromJson(Map<String, dynamic> json) {
    return PokemonStats(
      baseStat: json['base_stat'],
      stat: PokemonStat.fromJson(json['stat']),
    );
  }
}

class PokemonStat {
  const PokemonStat({required this.name});
  final String name;

  factory PokemonStat.fromJson(Map<String, dynamic> json) {
    return PokemonStat(
      name: json['name'],
    );
  }
}

class PokemonCry {
  const PokemonCry({required this.latest});
  final String latest;

  factory PokemonCry.fromJson(Map<String, dynamic> json) {
    return PokemonCry(
      latest: json['latest'],
    );
  }
}

class PokemonTypes {
  const PokemonTypes({required this.type});
  final PokemonType type;

  factory PokemonTypes.fromJson(Map<String, dynamic> json) {
    return PokemonTypes(
      type: PokemonType.fromJson(json['type']),
    );
  }
}

class PokemonType {
  const PokemonType({required this.name});
  final String name;

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      name: json['name'],
    );
  }
}
