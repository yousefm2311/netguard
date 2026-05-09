import '../../../../core/mock/mock_backend.dart';
import '../../domain/entities/help_article.dart';
import '../../domain/repositories/help_center_repository.dart';

class HelpCenterRepositoryImpl implements HelpCenterRepository {
  @override
  Future<List<HelpArticle>> fetchArticles() async => MockBackend.helpArticles();
}
