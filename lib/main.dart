import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app.dart';
import 'core/storage/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storageService = await StorageService().init();
  Get.put(storageService, permanent: true);
  runApp(const SmartNetControlApp());
}
