import 'package:flutter/material.dart';
import 'package:quizzle/components/result.dart';
import 'package:quizzle/models/ranking.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.ranking}) : super(key: key);

  final Ranking ranking;

  @override
  Widget build(BuildContext context) {
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
        body: Result(ranking: ranking));
  }
}
