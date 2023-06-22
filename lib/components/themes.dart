import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/components/themes_buttons.dart';
import 'package:quizzle/constants.dart';

import '../views/quiz_screen.dart';
import 'question_card.dart';

class ThemeBody extends StatelessWidget {
  const ThemeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [bgColorBlue, lightBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.1), //2/6
                  ThemesButtons(
                    pageToGo: QuizScreen(),
                    text: 'Desenho',
                  ),
                  SizedBox(height: Get.height * 0.05),
                  ThemesButtons(
                    pageToGo: QuizScreen(),
                    text: 'Música',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
