import 'package:flutter/material.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/components/body.dart';
import 'package:get/get.dart';
import 'package:quizzle/controllers/game_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GameController gameController = Get.find();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            FloatingActionButton.small(
                elevation: 0,
                shape: const CircleBorder(
                  side: BorderSide(width: 3, color: whiteColor),
                ),
                backgroundColor: Colors.transparent,
                onPressed: () =>
                    {gameController.resetGame(), Navigator.of(context).pop()},
                child: const Icon(
                  Icons.close,
                )),
          ],
        ),
      ),
      body: const Body(),
    );
  }
}
