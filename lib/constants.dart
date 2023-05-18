import 'package:flutter/material.dart';

const bgColorBlue = Color(0xFF630FFF);
const whiteColor = Color(0xFFFFFFFF);
const lightBlue = Color(0xFF478BF8);
const lightGreen = Color(0xFF39E1C0);
const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kGoldColor = Color(0xfff5cd15);
const kSilverColor = Color(0xffd0d0d0);
const kBronzeColor = Color(0xffda8860);
const kBackgroundGradient = LinearGradient(
  colors: [bgColorBlue, lightBlue],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 20.0;
const double kDefaultTitle = 32;
const double kDefaultSubTitle = 16;

const borderRadius = BorderRadius.all(Radius.circular(20));

const kDefaultQuestion = TextStyle(
  color: whiteColor,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const kDefaultQuestionAbout =
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
