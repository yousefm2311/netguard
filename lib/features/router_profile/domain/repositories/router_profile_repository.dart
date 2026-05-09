import '../entities/router_profile.dart';

abstract class RouterProfileRepository {
  Future<RouterProfile> detectRouter();

  Future<RouterProfile> downloadProfile(String routerModel);

  Future<RouterProfile?> getCachedProfile();
}
