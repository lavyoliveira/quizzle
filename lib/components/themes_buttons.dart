import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/constants.dart';
import '../views/initial_screen.dart';

class ThemesButtons extends StatelessWidget {
  const ThemesButtons({super.key, required this.pageToGo, required this.text});
  final dynamic pageToGo;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(pageToGo),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
        decoration: BoxDecoration(
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
