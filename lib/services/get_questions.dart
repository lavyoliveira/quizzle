// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizzle/models/questions.dart';
import 'dart:math';

class GetQuestions {
  final CollectionReference questionsCollection =
      FirebaseFirestore.instance.collection('perguntas');

  static const questionQuantity = 10;

  Future<List<Question>> getRandomQuestions() async {
    final List<Question> questions = [];

    try {
      final questionsList = await questionsCollection.orderBy('id').get();
      final numbers = List<int>.generate(questionsList.docs.length, (i) => i);
      final random = Random();
      final letters = numbers.toList()..shuffle(random);
      final selectedQuestions = letters.sublist(
          0,
          (questionsList.docs.length < questionQuantity
              ? questionsList.docs.length
              : questionQuantity));

      for (var i = 0; i < selectedQuestions.length; i++) {
        var doc = questionsList.docs[selectedQuestions[i]];
        Map<String, dynamic> docInfo = doc.data() as Map<String, dynamic>;
        List<String> optionsList = [];

        for (var i = 0; i < docInfo['alternativas'].length; i++) {
          optionsList.add(docInfo['alternativas'][i].toString());
        }

        optionsList.add(docInfo['resposta'].toString());
        optionsList.shuffle();

        var answer = optionsList.indexOf(docInfo['resposta'].toString()) + 1;

        questions.add(Question(
          id: doc.id,
          question: docInfo['pergunta'],
          answer: answer,
          options: optionsList,
        ));
      }
    } catch (e) {
      print(e);
    }

    return questions;
  }

  Future<List<Question>> getQuestionsByTheme(String themeId) async {
    final List<Question> questions = [];

    try {
      final questionsList =
          await questionsCollection.where('tema', isEqualTo: themeId).get();
      final numbers = List<int>.generate(questionsList.docs.length, (i) => i);
      final random = Random();
      final letters = numbers.toList()..shuffle(random);
      final selectedQuestions = letters.sublist(
          0,
          (questionsList.docs.length < questionQuantity
              ? questionsList.docs.length
              : questionQuantity));

      for (var i = 0; i < selectedQuestions.length; i++) {
        var doc = questionsList.docs[selectedQuestions[i]];
        Map<String, dynamic> docInfo = doc.data() as Map<String, dynamic>;
        List<String> optionsList = [];

        for (var i = 0; i < docInfo['alternativas'].length; i++) {
          optionsList.add(docInfo['alternativas'][i].toString());
        }

        optionsList.add(docInfo['resposta'].toString());
        optionsList.shuffle();

        var answer = optionsList.indexOf(docInfo['resposta'].toString()) + 1;

        questions.add(Question(
          id: doc.id,
          question: docInfo['pergunta'],
          answer: answer,
          options: optionsList,
        ));
      }
    } catch (e) {
      print(e);
    }

    return questions;
  }
}
