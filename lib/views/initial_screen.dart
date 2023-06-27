import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/components/ranking_card.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/components/inputs.dart';
import 'package:quizzle/controllers/user_controller.dart';
import 'package:quizzle/views/quiz_screen.dart';
import 'package:quizzle/views/result_screen.dart';
import 'package:quizzle/views/themes_screen.dart';
import '../components/initial_buttons.dart';
import '../views/rating_screen.dart';
import '../views/ranking_screen.dart';

import '../components/buttons.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());

    return Scaffold(
      backgroundColor: bgColorBlue,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [bgColorBlue, lightBlue, lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: Get.width * 0.3,
              left: Get.width * 0.3,
              child: Image.asset(
                "assets/images/logo.png",
                width: Get.width * 0.4,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.4), //2/6
                    InitialButton(
                      pageToGo: QuizScreen(),
                      text: 'Jogo Geral',
                    ),
                    SizedBox(height: Get.height * 0.05),
                    InitialButton(
                      pageToGo: ThemesScreen(),
                      text: 'Temas',
                    ),
                    SizedBox(height: Get.height * 0.05),
                    InitialButton(
                      pageToGo: RatingScreen(),
                      text: 'Minhas Pontuações',
                    ),
                    SizedBox(height: Get.height * 0.05),
                    InitialButton(
                      pageToGo: RankingScreen(),
                      text: 'Ranking',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
