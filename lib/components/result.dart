import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/controllers/themes_controller.dart';
import 'package:quizzle/controllers/user_controller.dart';
import 'package:quizzle/controllers/game_controller.dart';
import 'package:quizzle/components/ranking_card.dart';
import 'package:quizzle/models/games.dart';
import 'package:quizzle/models/ranking.dart';
import 'package:quizzle/models/themes.dart';

import '../views/initial_screen.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.ranking}) : super(key: key);

  final Ranking ranking;

  @override
  Widget build(BuildContext context) {
    GameController gameController = Get.find();
    Game game = gameController.game;

    UserController userController = Get.find();

    ThemeController themeController = Get.find();
    Themes theme = themeController.themes[0];

    for (var i = 0; i < themeController.themes.length; i++) {
      if (themeController.themes[i].id == game.id) {
        theme = themeController.themes[i];
      }
    }

    game.userName += ' (Você)';
    List<Game> jogos = ranking.jogos;
    jogos.add(game);
    if (jogos.length > 1) jogos.sort((a, b) => b.score.compareTo(a.score));
    int positionUser = jogos.length > 1 ? jogos.indexOf(game) + 1 : 1;

    return Container(
        decoration: const BoxDecoration(color: bgColorBlue),
        child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Text.rich(
                          TextSpan(
                            text: "Jogo finalizado!",
                            style: kDefaultQuestion,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          child: Column(
                            children: [
                              Text(
                                "Parabéns você conseguiu ${game.score} pontos!",
                                style: const TextStyle(
                                    color: whiteColor,
                                    fontSize: kDefaultSubTitle,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins'),
                              ),
                            ],
                          )),
                      const SizedBox(height: 32), // 1/6
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Divider(
                          color: whiteColor,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(height: 32), // 1/6
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Text.rich(
                          TextSpan(
                            text: "Ranking do tema: ${theme.theme}",
                            style: kDefaultQuestion,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24), // 1/6
                      Column(key: const Key('Ranking'), children: [
                        for (int index = 0;
                            index < 3 && index < jogos.length;
                            index++)
                          RankingCard(
                            text:
                                "${index + 1}º | ${jogos[index].score} pontos | ${(jogos[index].userName == '') ? 'Usuário Anônimo' : 'usuario: ${jogos[index].userName}'}",
                            color: index == 0
                                ? kGoldColor
                                : index == 1
                                    ? kSilverColor
                                    : index == 2
                                        ? kBronzeColor
                                        : whiteColor,
                          ),
                      ]),
                      if (positionUser > 3)
                        const Icon(
                          Icons.more_vert_outlined,
                          color: whiteColor,
                          size: 18,
                        ),
                      if (positionUser > 3) const SizedBox(height: 12), // 1/6
                      if (positionUser > 3)
                        RankingCard(
                          text: "$positionUserº | ${game.score} | Você",
                          color: whiteColor,
                        ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: (kDefaultPadding) * 2),
                        child: TextButton(
                          onPressed: () {
                            GameController.initGame(
                                game.themeId, theme.theme, userController);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "jogar novamente",
                                  style: TextStyle(
                                    color: kBlackColor,
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: (kDefaultPadding) * 2),
                        child: TextButton(
                          onPressed: () => Get.offAll(const InitialScreen()),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "voltar ao menu inicial",
                                  style: TextStyle(
                                    color: kBlackColor,
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
