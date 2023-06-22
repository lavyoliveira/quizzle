import 'package:flutter/material.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/components/result.dart';
import 'package:quizzle/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../components/ranking.dart';
import '../components/rating.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

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
                onPressed: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.close,
                )),
          ],
        ),
      ),
      body: const RankingResult(),
    );
  }
}
