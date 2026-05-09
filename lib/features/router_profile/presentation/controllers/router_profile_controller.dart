import 'package:get/get.dart';

import '../../domain/entities/router_profile.dart';
import '../../domain/repositories/router_profile_repository.dart';

class RouterProfileController extends GetxController {
  RouterProfileController({
    required this.repository,
  });

  final RouterProfileRepository repository;

  RouterProfile? detectedProfile;
  RouterProfile? cachedProfile;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    loadCachedProfile();
  }

  Future<void> loadCachedProfile() async {
    cachedProfile = await repository.getCachedProfile();
    update();
  }

  Future<void> detectRouter() async {
    isLoading = true;
    update();
    detectedProfile = await repository.detectRouter();
    isLoading = false;
    update();
  }

  Future<void> downloadProfile() async {
    final model = detectedProfile?.model ?? cachedProfile?.model ?? 'Router';
    isLoading = true;
    update();
    cachedProfile = await repository.downloadProfile(model);
    isLoading = false;
    update();
  }
}
