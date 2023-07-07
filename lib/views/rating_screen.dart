import 'package:flutter/material.dart';
import 'package:quizzle/constants.dart';
import '../components/rating.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({Key? key, required this.score}) : super(key: key);

  final List<dynamic> score;

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
              child: Semantics(
                explicitChildNodes: true,
                label: 'Botão voltar',
                child: const Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
      body: RatingResult(score: score),
    );
  }
}
