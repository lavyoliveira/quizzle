import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:quizzle/constants.dart';

const types = {
  'error': {
    'icon': Icon(
      Icons.close_outlined,
      color: Colors.red,
      size: 50,
    ),
    'sound': 'assets/sounds/error.wav'
  },
  'right': {
    'icon': Icon(
      Icons.check_outlined,
      color: Colors.green,
      size: 50,
    ),
    'sound': 'assets/sounds/win.wav'
  },
  'wrong': {
    'icon': Icon(
      Icons.close_outlined,
      color: Colors.red,
      size: 50,
    ),
    'sound': 'assets/sounds/fail.wav'
  }
};

class Alert {
  static Future<void> showAlert(
      BuildContext context, String title, String message, String type) async {
    playSound() async {
      await alertSound(context, types[type]!['sound'] as String);
    }

    playSound();

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          //title: const Text("Resposta errada"),
          semanticLabel: title,
          titlePadding: const EdgeInsets.all(0),
          content: FocusScope(
            child: SizedBox(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  types[type] != null
                      ? types[type]!['icon'] as Icon
                      : types['error']!['icon'] as Icon,
                  const SizedBox(height: 12),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: kBlackColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        color: kBlackColor),
                  ),
                ],
              ),
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

  static Future<void> alertSound(BuildContext context, String file) async {
    FlutterSoundPlayer? mPlayer = FlutterSoundPlayer();
    Uint8List? soundData;

    //var asset = await rootBundle.load('assets/sounds/error.wav');
    var asset = await rootBundle.load(file);
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
