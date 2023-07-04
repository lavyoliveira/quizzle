// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizzle/models/themes.dart';

class GetThemes {
  final CollectionReference themesCollection =
      FirebaseFirestore.instance.collection('temas');

  Future<List<Themes>> getThemes() async {
    final List<Themes> themes = [];

    try {
      final themesList = await themesCollection.get();

      for (var doc in themesList.docs) {
        var docInfo = doc.data() as Map<String, dynamic>;

        themes.add(Themes(
          id: doc.id,
          theme: docInfo['tema'],
          description: docInfo['descricao'],
        ));
      }
    } catch (e) {
      print(e);
    }

    return themes;
  }
}
