import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/components/error_alert.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/controllers/user_controller.dart';
import 'package:quizzle/views/initial_screen.dart';

class ButtonStart extends StatelessWidget {
  const ButtonStart({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();

    return InkWell(
      onTap: () => {
        if (userController.user.name != "")
          {Get.to(() => const InitialScreen())}
        else
          {
            ErrorAlert.alertSound(context),
            ErrorAlert.alert(
                context, "Nome inválido", "Por favor, insira um nome válido")
          }
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
        decoration: const BoxDecoration(
          color: lightGreen,
          borderRadius: borderRadius,
        ),
        child: Text(
          "Entrar",
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}

// login button
class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: () => UserController().signInWithGoogleAccount(),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
        decoration: const BoxDecoration(
          color: lightGreen,
          borderRadius: borderRadius,
        ),
        child: Text(
          "Entrar com Google",
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({super.key, required this.onPress, required this.text});

  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPress(),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: borderRadius,
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
