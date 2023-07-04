import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/controllers/user_controller.dart';

class InputName extends StatelessWidget {
  const InputName({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();

    return TextField(
      style: const TextStyle(color: whiteColor, fontFamily: 'OpenSans'),
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: whiteColor),
        filled: true,
        fillColor: lightBlue,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (value) => {userController.user.name = value},
    );
  }
}
