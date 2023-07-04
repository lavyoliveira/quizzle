import 'package:quizzle/models/questions.dart';

class Game {
  String id, themeId, userId, userName;
  int score;
  List<Question> questions;

  Game(
      {required this.id,
      required this.questions,
      this.score = 0,
      required this.themeId,
      required this.userId,
      required this.userName});

  String get getId => id;
  int get getScore => score;
  List<Question> get getQuestions => questions;
  String get getThemeId => themeId;
  String get getUserId => userId;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'score': score,
      'questions': questions,
      'themeId': themeId,
      'userId': userId
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
        id: map['id'],
        score: map['score'],
        questions: map['questions'],
        themeId: map['themeId'],
        userId: map['userId'],
        userName: map['userName']);
  }

  @override
  String toString() {
    return 'Game(id: $id, score: $score, questions: $questions, themeId: $themeId, userId: $userId, userName: $userName)';
  }

  void save() {}
}
