import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quizzle/models/questions.dart';
import 'package:quizzle/controllers/user_controller.dart';
import 'package:quizzle/views/result_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late PageController _pageController;
  PageController get pageController => _pageController;
  //  find a way to get the userController from the main.dart
  UserController userController = Get.find<UserController>();

  final List<Question> _questions = sampleData
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;

      userController.setScore(_numOfCorrectAns);
    }

    update();

    Future.delayed(const Duration(seconds: 3), () {
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

    Get.offAll(() => const ResultScreen());
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
