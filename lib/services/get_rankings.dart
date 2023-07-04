// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quizzle/controllers/themes_controller.dart';
import 'package:quizzle/models/ranking.dart';
import 'package:quizzle/models/games.dart';
import 'package:quizzle/models/themes.dart';

class GetRankings {
  final CollectionReference rankingsCollection =
      FirebaseFirestore.instance.collection('ranking');

  Future<Ranking> getRanking(String themeId) async {
    try {
      final themes = Get.find<ThemeController>().themes;
      final theme = themes.firstWhere((element) => element.id == themeId);

      final rankingList =
          await rankingsCollection.where('tema', isEqualTo: themeId).get();
      final rankingId = rankingList.docs[0].id;
      final rankingDocs = rankingList.docs[0].data() as Map<String, dynamic>;
      var rankingScores = rankingDocs['pontuacoes'] as List<dynamic>;

      if (rankingScores.isEmpty) {
        return Ranking(
          id: rankingId,
          nome: theme.theme,
          descricao: theme.description,
          tema: theme,
          jogos: [],
        );
      }

      rankingScores.sort((a, b) => b['pontuacao'].compareTo(a['pontuacao']));

      Ranking ranking = Ranking(
        id: rankingId,
        nome: theme.theme,
        descricao: theme.description,
        tema: theme,
        jogos: rankingDocs['pontuacoes']
            .map<Game>((game) => Game(
                id: game['id'],
                userId: game['usuarioId'],
                userName: game['usuario'],
                themeId: game['tema'],
                questions: [],
                score: game['pontuacao']))
            .toList(),
      );

      return ranking;
    } catch (e) {
      print(e.toString());
      return Ranking(
        id: '',
        nome: '',
        descricao: '',
        tema: Themes(id: '', theme: '', description: ''),
        jogos: [],
      );
    }
  }
}
