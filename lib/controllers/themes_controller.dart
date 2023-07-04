import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quizzle/models/themes.dart';
import 'package:quizzle/services/get_themes.dart';

class ThemeController extends GetxController {
  final List<Themes> _themes = [];

  @override
  void onInit() {
    super.onInit();
    fetchThemes();
  }

  void fetchThemes() async {
    final themes = await GetThemes().getThemes();
    _themes.assignAll(themes);
    update();
  }

  List<Themes> get themes => _themes;

  Themes getThemeById(String id) {
    return _themes.firstWhere((element) => element.id == id);
  }
}
