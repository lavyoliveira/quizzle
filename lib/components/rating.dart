import 'package:flutter/material.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/components/ranking_card.dart';

class RatingResult extends StatelessWidget {
  const RatingResult({Key? key, required this.score}) : super(key: key);

  final List<dynamic> score;

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
                            text: "Minhas pontuações",
                            style: kDefaultQuestion,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24), // 1/6
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Divider(
                          color: whiteColor,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(height: 60), // 1/6
                      Column(key: const Key('Ranking'), children: [
                        for (int index = 0; index < score.length; index++)
                          RankingCard(
                            text:
                                "${index + 1}º | ${score[index]['score']} pontos | tema: ${score[index]['theme']}",
                            color: index == 0
                                ? kGoldColor
                                : index == 1
                                    ? kSilverColor
                                    : index == 2
                                        ? kBronzeColor
                                        : whiteColor,
                          ),
                      ]),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            )));
  }
}
