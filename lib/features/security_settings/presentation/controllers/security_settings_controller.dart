import 'package:get/get.dart';

import '../../domain/entities/security_settings_state.dart';
import '../../domain/repositories/security_settings_repository.dart';

class SecuritySettingsController extends GetxController {
  SecuritySettingsController({
    required this.repository,
  });

  final SecuritySettingsRepository repository;

  bool isLoading = false;
  SecuritySettingsState? state;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading = true;
    update();
    state = await repository.loadState();
    isLoading = false;
    update();
  }

  Future<void> patch(SecuritySettingsState nextState) async {
    state = await repository.saveState(nextState);
    update();
  }
}
