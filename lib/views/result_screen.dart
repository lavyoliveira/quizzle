import 'package:flutter/material.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/components/result.dart';
import 'package:quizzle/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

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
          ),
        ),
        body: const Result());
  }
}
