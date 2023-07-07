import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/controllers/game_controller.dart';
import 'package:quizzle/models/questions.dart';

import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    GameController controller = Get.find();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Text(
            question.question,
            style: kDefaultQuestionAbout,
          ),
          const SizedBox(height: 30),
          ...List.generate(
            question.options.length,
            (index) => Semantics(
              label: 'Alternativa',
              child: Option(
                index: index,
                text: question.options[index],
                press: () => controller.checkAns(question, index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
