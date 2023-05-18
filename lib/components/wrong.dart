import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:quizzle/constants.dart';

class WrongAnswer {
  static Future<void> alert(BuildContext context, String awnserCorrect) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          //title: const Text("Resposta errada"),
          titlePadding: const EdgeInsets.all(0),
          content: SizedBox(
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.close_outlined,
                  color: Colors.red,
                  size: 50,
                ),
                const SizedBox(height: 12),
                const Text(
                  "Resposta incorreta",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: kBlackColor),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Você errou a resposta!",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          color: kBlackColor),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "A resposta correta é ",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: kBlackColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          awnserCorrect,
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              color: bgColorBlue),
                        ),
                        const Text(
                          "!",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              color: kBlackColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              child: const Text(
                "Ok",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: bgColorBlue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> alertSound(BuildContext context) async {
    FlutterSoundPlayer? mPlayer = FlutterSoundPlayer();
    Uint8List? soundData;

    var asset = await rootBundle.load('assets/sounds/fail.wav');
    await mPlayer.openPlayer();
    soundData = asset.buffer.asUint8List();

    await mPlayer.setVolume(1.0);
    await mPlayer.startPlayerFromStream(
      codec: Codec.pcm16,
      numChannels: 1,
      sampleRate: 78100,
    );

    await mPlayer.feedFromStream(soundData);
    await mPlayer.stopPlayer();
  }
}
