import 'package:get/get.dart';

import '../../domain/entities/help_article.dart';
import '../../domain/repositories/help_center_repository.dart';

class HelpCenterController extends GetxController {
  HelpCenterController({
    required this.repository,
  });

  final HelpCenterRepository repository;

  bool isLoading = false;
  List<HelpArticle> articles = [];

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    isLoading = true;
    update();
    articles = await repository.fetchArticles();
    isLoading = false;
    update();
  }
}
