// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizzle/models/games.dart';

class AddRanking {
  final CollectionReference rankingsCollection =
      FirebaseFirestore.instance.collection('ranking');

  Future<void> add(Game game) async {
    try {
      final rankingTheme =
          await rankingsCollection.where('tema', isEqualTo: game.themeId).get();

      final score = {
        'id': game.id,
        'pontuacao': game.score,
        'tema': game.themeId,
        'usuarioId': game.userId,
        'usuario': game.userName,
      };

      final rankingId = rankingTheme.docs[0].id;

      if (rankingTheme.docs.isEmpty) {
        final newRanking = {
          'tema': game.themeId,
          'pontuacoes': [score],
        };
        await rankingsCollection.add(newRanking);
        return;
      }

      final rankingDocs = rankingTheme.docs[0].data() as Map<String, dynamic>;
      final rankingScores = rankingDocs['pontuacoes'] as List<dynamic>;
      final scoresQuantity = rankingScores.length;

      rankingScores.add(score);
      rankingScores.sort((a, b) => b['pontuacao'].compareTo(a['pontuacao']));

      if (scoresQuantity > 20) rankingScores.sublist(0, 20);

      await rankingsCollection.doc(rankingId).update({
        'pontuacoes': rankingScores,
      });
    } catch (e) {
      print(e);
    }
  }
}
