import 'package:get/get.dart';
import 'package:quizzle/models/ranking.dart';
import 'package:quizzle/services/get_rankings.dart';
import 'package:quizzle/views/ranking_screen.dart';

class RankingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RankingController();

  static Future<void> initRanking(String themeId) async {
    Get.delete<RankingController>();
    Get.lazyPut(() => RankingController());

    Ranking ranking = await GetRankings().getRanking(themeId);

    return Get.to(() => RankingScreen(ranking: ranking));
  }
}
