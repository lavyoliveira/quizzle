import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizzle/components/right.dart';
import 'package:quizzle/components/wrong.dart';
import 'package:quizzle/controllers/question_controller.dart';
import 'package:quizzle/controllers/user_controller.dart';
import 'package:quizzle/models/games.dart';
import 'package:quizzle/models/questions.dart';
import 'package:quizzle/models/ranking.dart';
import 'package:quizzle/services/add_ranking.dart';
import 'package:quizzle/services/get_rankings.dart';
import 'package:quizzle/views/result_screen.dart';
import 'package:uuid/uuid.dart';
import 'package:quizzle/views/quiz_screen.dart';
import 'package:quizzle/services/create_game.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class GameController extends GetxController
    with GetSingleTickerProviderStateMixin {
  GameController({required this.game, required this.questionController});

  final Game game;
  final QuestionController questionController;

  get getGame => game;
  get getQuestionController => questionController;

  @override
  void dispose() {
    questionController.pageController.dispose();
    super.dispose();
  }

  static Future<void> initGame(
      String themeId, String theme, UserController userController) async {
    Get.delete<GameController>();
    Get.delete<Game>();

    const uuid = Uuid();
    String gameId = uuid.v4();

    QuestionController questionController = Get.put(QuestionController());
    await questionController.fetchQuestions(themeId, theme);

    String userId = userController.user.id;

    Get.put(Game(
      id: gameId,
      questions: questionController.questions,
      themeId: themeId,
      userId: userId,
      userName: userController.user.name,
    ));

    Get.lazyPut(() => GameController(
        game: Get.find<Game>(),
        questionController: Get.find<QuestionController>()));
    return Get.to(() => const QuizScreen());
  }

  void checkAns(Question question, int selectedIndex) {
    if (questionController.isAnswered) return;

    questionController.isAnswered = true;
    questionController.correctAns = question.answer;
    questionController.selectedAns = selectedIndex;

    if (questionController.correctAns == questionController.selectedAns + 1) {
      updateScore();
      RightAnswer.alertSound(Get.context!);
      RightAnswer.alert(Get.context!);
    } else {
      WrongAnswer.alertSound(Get.context!);
      WrongAnswer.alert(Get.context!, question.options[question.answer - 1]);
    }

    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void updateScore() {
    game.score += 10;
  }

  void nextQuestion() {
    var questionsQuantity = game.questions.length;
    var questionNumber = questionController.questionNumber.value;

    if (questionNumber != questionsQuantity) {
      questionController.questionNumber.value++;
      questionController.pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      questionController.isAnswered = false;
    } else {
      endGame();
    }
  }

  void resetGame() {
    game.score = 0;
    game.questions.clear();
    questionController.questionNumber.value = 1;
    questionController.pageController.jumpToPage(0);
    questionController.isAnswered = false;
  }

  Future<void> endGame() async {
    await CreateGame().create(game);
    Ranking ranking = await GetRankings().getRanking(game.themeId);
    await AddRanking().add(game);

    if (game.userId == '') {
      saveGameLocally();
    }

    return Get.offAll(() => ResultScreen(ranking: ranking));
  }

  Future<void> saveGameLocally() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    if (!await Directory(path).exists()) {
      await Directory(path).create(recursive: true);
    }

    if (!await File('$path/pontuacoes.json').exists()) {
      await File('$path/pontuacoes.json').create(recursive: true);
    }

    File file = File('$path/pontuacoes.json');
    String content = await file.readAsString();

    if (content == '') {
      content = '[]';
    }

    List<dynamic> scores = GetUtils.isNullOrBlank(content) == true
        ? []
        : jsonDecode(content) as List<dynamic>;

    scores.add({
      'id': game.id,
      'score': game.score,
      'themeId': game.themeId,
      'userId': game.userId,
      'userName': game.userName,
    });

    scores.sort((a, b) => b['score'].compareTo(a['score']));

    await file.writeAsString(jsonEncode(scores));
  }

  static Future<List<dynamic>> getScores() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    if (!await Directory(path).exists()) {
      await Directory(path).create(recursive: true);
    }

    if (!await File('$path/pontuacoes.json').exists()) {
      await File('$path/pontuacoes.json').create(recursive: true);
    }

    File file = File('$path/pontuacoes.json');
    String content = await file.readAsString();

    if (content == '') {
      content = '[]';
    }

    List<dynamic> scores = GetUtils.isNullOrBlank(content) == true
        ? []
        : jsonDecode(content) as List<dynamic>;

    return scores;
  }
}
