// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizzle/controllers/game_controller.dart';
import 'package:quizzle/controllers/themes_controller.dart';
import 'package:quizzle/models/themes.dart';
import 'package:quizzle/models/users.dart';
import 'package:quizzle/views/rating_screen.dart';

class UserController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users _user = Users();
  late User _firebaseUser;
  Users get user => _user;

  void setUser(Users user) {
    _user = user;

    update();
  }

  String get name => _user.name;

  void setName(String name) {
    _user.setName(name);

    update();
  }

  void start() {}

  Future<void> getScores() async {
    ThemeController themeController = Get.find();
    List<Themes> themes = themeController.themes;

    try {
      final User? currentUser = _auth.currentUser;

      List<dynamic> score = await GameController.getScores();

      if (currentUser != null) {
        print('Usuário não logado.');
      }

      for (var i = 0; i < score.length; i++) {
        final theme =
            themes.firstWhere((element) => element.id == score[i]['themeId']);

        score[i]['theme'] = theme.theme;
      }

      return Get.to(() => RatingScreen(score: score));
    } catch (e) {
      print(e);
    }
  }

  void signInWithGoogleAccount() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;
      final googleAuthCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await _auth.signInWithCredential(googleAuthCredential);
      _firebaseUser = _auth.currentUser!;
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Login falhou.',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // void signInWithGoogleAccount() async {
  //   try {
  //     GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  //     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  //     GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleUser!.authentication;
  //     final googleAuthCredential = GoogleAuthProvider.credential(
  //       idToken: googleSignInAuthentication.idToken,
  //       accessToken: googleSignInAuthentication.accessToken,
  //     );

  //     await _auth.signInWithCredential(googleAuthCredential);
  //     _user.user = _auth.currentUser!;
  //   } catch (error) {
  //     String errorMessage =
  //         error.toString().substring(error.toString().indexOf(' ') + 1);
  //     Get.snackbar(
  //       'Login falhou.',
  //       errorMessage,
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  // }

  // void signUp(String email, String password) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     _user = _auth.currentUser!;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void signOut() async {
  //   await _auth.signOut();
  //   _user = _auth.currentUser!;
  // }
}
