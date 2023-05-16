import 'package:flutter/material.dart';
import 'package:xen_popup_card/xen_card.dart';

class WrongAnswer extends StatelessWidget {
  const WrongAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog(
        context: context,
        builder: (builder) => XenPopupCard(
          body: ListView(
            children: const [
              Text("body"),
            ],
          ),
        ),
      ),
      child: const Text("open card with gutter and app bar"),
    );
  }
}
