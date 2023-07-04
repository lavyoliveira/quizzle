import 'package:quizzle/models/games.dart';
import 'package:quizzle/models/themes.dart';

class Ranking {
  String id, nome, descricao;
  Themes tema;
  List<Game> jogos;

  Ranking(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.tema,
      required this.jogos});

  String get getId => id;
  String get getNome => nome;
  String get getDescricao => descricao;
  Themes get getTema => tema;
  List<Game> get getJogos => jogos;

  void setNome(String nome) {
    nome = nome;
  }

  void setDescricao(String descricao) {
    descricao = descricao;
  }

  void setTema(Themes tema) {
    tema = tema;
  }

  void setJogos(List<Game> jogos) {
    jogos = jogos;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'tema': tema,
      'jogos': jogos,
    };
  }

  factory Ranking.fromMap(Map<String, dynamic> map) {
    return Ranking(
        id: map['id'],
        nome: map['nome'],
        descricao: map['descricao'],
        tema: map['tema'],
        jogos: map['jogos']);
  }

  @override
  String toString() {
    return 'Ranking(id: $id, nome: $nome, descricao: $descricao, tema: $tema, jogos: $jogos)';
  }

  Future<List<Game>> getByTheme(String themeId) async {
    return [];
  }
}
