import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/constants.dart';

class InitialButton extends StatelessWidget {
  const InitialButton({super.key, required this.pageToGo, required this.text});
  final dynamic pageToGo;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(pageToGo),
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
