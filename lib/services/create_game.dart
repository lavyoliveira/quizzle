// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizzle/models/games.dart';
import 'package:http/http.dart';

class CreateGame {
  final CollectionReference gamesCollection =
      FirebaseFirestore.instance.collection('jogos');

  Future<void> create(Game game) async {
    final questionsList = game.questions.map((e) => e.id).toList();
    final newGame = {
      'id': game.id,
      'pontuacao': game.score,
      'perguntas': questionsList,
      'tema': game.themeId,
      'usuarioId': game.userId,
      'usuario': game.userName,
    };

    final url =
        Uri.parse('https://8a84-177-124-22-114.ngrok-free.app/games/new');

    try {
      await gamesCollection.doc(game.id).set(newGame);
      //post(url, body: newGame);
    } catch (e) {
      print(e);
    }
  }
}
