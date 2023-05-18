import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quizzle/components/right.dart';
import 'package:quizzle/components/wrong.dart';
import 'package:quizzle/controllers/question_controller.dart';
import 'package:xen_popup_card/xen_card.dart';

import '../../../constants.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: kDefaultPadding),
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: borderRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${index + 1}. $text",
                    style: const TextStyle(color: kBlackColor, fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
