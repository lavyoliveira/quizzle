import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/controllers/user_controller.dart';
import 'package:quizzle/components/ranking_card.dart';
import 'package:quizzle/views/welcome_screen.dart';
import 'package:quizzle/views/quiz_screen.dart';

class RatingResult extends StatelessWidget {
  const RatingResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    print(userController.score);
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
                        for (int index = 0; index < 3; index++)
                          RankingCard(
                            text:
                                "${index + 1}° | ${userController.score * 10} | ${userController.name}",
                            color: index == 0
                                ? kGoldColor
                                : index == 1
                                    ? kSilverColor
                                    : index == 2
                                        ? kBronzeColor
                                        : whiteColor,
                          ),
                      ]),
                      const Icon(
                        Icons.more_vert_outlined,
                        color: whiteColor,
                        size: 18,
                      ),
                      const SizedBox(height: 12), // 1/6
                      RankingCard(
                        text:
                            "x° | ${userController.score * 10} | ${userController.name}",
                        color: whiteColor,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            )));
  }
}
