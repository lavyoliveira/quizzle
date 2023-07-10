import 'package:flutter/material.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/components/ranking_card.dart';
import 'package:quizzle/models/games.dart';
import 'package:quizzle/models/ranking.dart';

class RankingResult extends StatelessWidget {
  const RankingResult({Key? key, required this.ranking}) : super(key: key);

  final Ranking ranking;

  @override
  Widget build(BuildContext context) {
    List<Game> games = ranking.jogos;
    int gamesLength = games.length;

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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Text.rich(
                          TextSpan(
                            text: "Ranking ${ranking.nome}",
                            style: kDefaultQuestion,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32), // 1/6
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Divider(
                          color: whiteColor,
                          thickness: 1,
                        ),
                      ), // 1/6
                      const SizedBox(height: 60), // 1/6
                      Column(key: const Key('Ranking'), children: [
                        if (gamesLength == 0)
                          const Text(
                            "Nenhum jogo foi realizado ainda.",
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 20,
                            ),
                          ),
                        if (gamesLength > 0)
                          for (int index = 0; index < gamesLength; index++)
                            RankingCard(
                              text:
                                  "${index + 1}º | ${games[index].score} pontos | ${(games[index].userName == '') ? 'Usuário Anônimo' : 'usuario: ${games[index].userName}'}",
                              color: index == 0
                                  ? kGoldColor
                                  : index == 1
                                      ? kSilverColor
                                      : index == 2
                                          ? kBronzeColor
                                          : whiteColor,
                            ),
                      ]),
                    ],
                  ),
                ),
              ],
            )));
  }
}
