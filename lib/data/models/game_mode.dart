enum GameMode {
  classic,
  multiplayer4,
}

extension GameModeX on GameMode {
  String get key => switch (this) {
        GameMode.classic => 'classic',
        GameMode.multiplayer4 => 'multiplayer4',
      };

  String get title => switch (this) {
        GameMode.classic => 'Clásico 3x3',
        GameMode.multiplayer4 => 'Multijugador 4',
      };

  String get shortTitle => switch (this) {
        GameMode.classic => 'Clásico',
        GameMode.multiplayer4 => '4 jugadores',
      };

  String get description => switch (this) {
        GameMode.classic => 'Dos jugadores, tablero 3x3 y línea ganadora de 3.',
        GameMode.multiplayer4 => 'Hasta cuatro jugadores, tablero 6x6 y línea ganadora de 4.',
      };

  int get boardSize => switch (this) {
        GameMode.classic => 3,
        GameMode.multiplayer4 => 6,
      };

  int get maxPlayers => switch (this) {
        GameMode.classic => 2,
        GameMode.multiplayer4 => 4,
      };

  int get minPlayersToStart => switch (this) {
        GameMode.classic => 2,
        GameMode.multiplayer4 => 2,
      };

  int get winLength => switch (this) {
        GameMode.classic => 3,
        GameMode.multiplayer4 => 4,
      };

  static GameMode fromKey(String key) {
    return GameMode.values.firstWhere(
      (mode) => mode.key == key,
      orElse: () => GameMode.classic,
    );
  }
}
