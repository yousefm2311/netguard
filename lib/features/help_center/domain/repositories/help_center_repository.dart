import '../entities/help_article.dart';

abstract class HelpCenterRepository {
  Future<List<HelpArticle>> fetchArticles();
}
