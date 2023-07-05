import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/components/buttons.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/controllers/game_controller.dart';
import 'package:quizzle/controllers/themes_controller.dart';
import 'package:quizzle/controllers/user_controller.dart';

class ThemeBody extends StatelessWidget {
  const ThemeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themes = Get.find<ThemeController>().themes;
    final userController = Get.find<UserController>();

    for (var i = 0; i < themes.length; i++) {
      if (themes[i].theme.toLowerCase() == 'geral') {
        themes.removeAt(i);
        break;
      }
    }

    final themesQty = themes.length;

    themes.sort((a, b) => a.theme.compareTo(b.theme));

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
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: themesQty.ceil(),
                    itemBuilder: (context, index) {
                      if (index == themesQty) {
                        return SizedBox(height: Get.height * 0.05);
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ButtonPrimary(
                              onPress: () {
                                GameController.initGame(themes[index].id,
                                    themes[index].theme, userController);
                              },
                              text: themes[index].theme),
                          SizedBox(height: Get.height * 0.03),
                        ],
                      );
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
