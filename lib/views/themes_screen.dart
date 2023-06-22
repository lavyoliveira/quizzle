import 'package:flutter/material.dart';
import 'package:quizzle/components/themes.dart';
import 'package:quizzle/constants.dart';
import 'package:quizzle/components/body.dart';

class ThemesScreen extends StatelessWidget {
  const ThemesScreen({super.key});

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
                child: const Icon(
                  Icons.close,
                )),
          ],
        ),
      ),
      body: const ThemeBody(),
    );
  }
}
