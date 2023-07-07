// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizzle/models/questions.dart';
// import 'package:quizzle/components/wrong.dart';
// import 'package:quizzle/components/right.dart';
import 'package:quizzle/services/get_questions.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<Question> _questions = [];
  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;
  set isAnswered(bool isAnswered) => _isAnswered = isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;
  set correctAns(int correctAns) => _correctAns = correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;
  set selectedAns(int selectedAns) => _selectedAns = selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  @override
  void onInit() {
    _questions.clear();
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
  }

  Future<void> fetchQuestions(String themeId, String theme) async {
    if (theme.toLowerCase() == "geral") {
      final questions = await GetQuestions().getRandomQuestions();
      _questions.assignAll(questions);
      update();
      return;
    } else {
      final questions = await GetQuestions().getQuestionsByTheme(themeId);
      _questions.assignAll(questions);
      update();
      return;
    }
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns + 1) {
      // RightAnswer.alertSound(Get.context!);
      // RightAnswer.alert(Get.context!);
    } else {
      // WrongAnswer.alertSound(Get.context!);
      // WrongAnswer.alert(Get.context!, question.options[question.answer - 1]);
    }

    update();

    Future.delayed(const Duration(seconds: 3), () {
      // if (_correctAns != _selectedAns + 1) {
      //   Get.offAll(() => const ResultScreen());
      // }

      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      return;
    }

    //Get.offAll(() => const ResultScreen());
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
