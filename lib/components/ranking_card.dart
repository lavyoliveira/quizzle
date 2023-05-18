import 'package:flutter/material.dart';
import '../../../constants.dart';

class RankingCard extends StatelessWidget {
  const RankingCard({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: kBlackColor,
                      fontFamily: 'NotoSans',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Icon(
                    Icons.emoji_events_outlined,
                    color: whiteColor,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
        ]));
  }
}
