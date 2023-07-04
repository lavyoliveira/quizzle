import 'package:quizzle/models/games.dart';

class Users {
  String id, name;
  List<Game> games;

  Users({
    this.id = '',
    this.name = '',
    this.games = const [],
  });

  String get getId => id;
  String get getName => name;
  List<Game> get getGames => games;

  void setName(String name) {
    name = name;
  }

  void setGames(List<Game> games) {
    games = games;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'games': games,
    };
  }
}
