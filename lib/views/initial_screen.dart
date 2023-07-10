import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/components/buttons.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/controllers/game_controller.dart';
import 'package:quizzle/controllers/user_controller.dart';
import 'package:quizzle/views/ranking_select_screen.dart';
import 'package:quizzle/views/themes_screen.dart';
import '../components/initial_buttons.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(color: bgColorBlue),
        child: SingleChildScrollView(
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
                      SizedBox(height: Get.height * 0.33),
                      ButtonPrimary(
                        onPress: () {
                          GameController.initGame(
                            'tDgUUnib7rNwV4Kedj3L',
                            'geral',
                            userController,
                          );
                        },
                        text: "Jogo Geral",
                        focus: true,
                      ),
                      SizedBox(height: Get.height * 0.04),
                      ButtonPrimary(
                        onPress: () => Get.to(const ThemesScreen()),
                        text: "Temas",
                        focus: false,
                      ),
                      SizedBox(height: Get.height * 0.04),
                      ButtonPrimary(
                        onPress: () {
                          userController.getScores();
                        },
                        text: "Minhas Pontuações",
                        focus: false,
                      ),
                      SizedBox(height: Get.height * 0.04),
                      ButtonPrimary(
                        onPress: () => Get.to(const RankingSelectScreen()),
                        text: "Ranking",
                        focus: false,
                      ),
                      SizedBox(height: Get.height * 0.04),

                      // FocusScope(
                      //   child: ButtonPrimary(
                      //     onPress: () {
                      //       GameController.initGame(
                      //         'tDgUUnib7rNwV4Kedj3L',
                      //         'geral',
                      //         userController,
                      //       );
                      //     },
                      //     text: "Jogo Geral",
                      //   ),
                      // ),
                      // SizedBox(height: Get.height * 0.04),
                      // const InitialButton(
                      //   pageToGo: ThemesScreen(),
                      //   text: 'Temas',
                      // ),
                      // SizedBox(height: Get.height * 0.04),
                      // ButtonPrimary(
                      //   onPress: () {
                      //     userController.getScores();
                      //   },
                      //   text: "Minhas Pontuações",
                      // ),
                      // SizedBox(height: Get.height * 0.04),
                      // const InitialButton(
                      //   pageToGo: RankingSelectScreen(),
                      //   text: 'Ranking',
                      // ),
                      const SizedBox(
                          height:
                              30), // Adicione um espaço extra no final, se necessário
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
