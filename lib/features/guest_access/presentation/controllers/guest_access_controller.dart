import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/guest_access_settings.dart';
import '../../domain/repositories/guest_access_repository.dart';

class GuestAccessController extends GetxController {
  GuestAccessController({
    required this.repository,
  });

  final GuestAccessRepository repository;

  bool isLoading = false;
  GuestAccessSettings? settings;
  late final TextEditingController ssidController;
  late final TextEditingController passwordController;
  late final TextEditingController quotaController;
  late final TextEditingController speedController;
  late final TextEditingController scheduleController;

  @override
  void onInit() {
    super.onInit();
    ssidController = TextEditingController();
    passwordController = TextEditingController();
    quotaController = TextEditingController();
    speedController = TextEditingController();
    scheduleController = TextEditingController();
    load();
  }

  Future<void> load() async {
    isLoading = true;
    update();
    settings = await repository.loadSettings();
    ssidController.text = settings!.networkName;
    passwordController.text = settings!.password;
    quotaController.text = settings!.quotaGb.toString();
    speedController.text = settings!.speedLimitMbps.toString();
    scheduleController.text = settings!.scheduleLabel;
    isLoading = false;
    update();
  }

  Future<void> toggleEnabled(bool value) async {
    if (settings == null) return;
    settings = await repository.saveSettings(settings!.copyWith(enabled: value));
    update();
  }

  Future<void> save() async {
    if (settings == null) return;
    settings = await repository.saveSettings(
      settings!.copyWith(
        networkName: ssidController.text.trim(),
        password: passwordController.text.trim(),
        quotaGb: int.tryParse(quotaController.text.trim()) ?? settings!.quotaGb,
        speedLimitMbps:
            int.tryParse(speedController.text.trim()) ?? settings!.speedLimitMbps,
        scheduleLabel: scheduleController.text.trim(),
      ),
    );
    Get.snackbar('Saved', 'Guest access settings updated.');
    update();
  }
}
