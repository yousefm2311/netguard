import '../../data/repositories/stats_repository.dart';
import '../../data/models/stats.dart';

class GetStatsUseCase {
  final StatsRepository _repository;

  GetStatsUseCase(this._repository);

  Future<Stats> execute() {
    return _repository.getStats();
  }
}
