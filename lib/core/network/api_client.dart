import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../storage/app_prefs.dart';
import '../storage/secure_storage_service.dart';

class ApiClient extends GetxService {
  late final Dio dio;

  @override
  void onInit() {
    super.onInit();

    dio = Dio(
      BaseOptions(
        baseUrl: AppPrefs.getBaseUrl(),
        connectTimeout: const Duration(seconds: 12),
        receiveTimeout: const Duration(seconds: 12),
        sendTimeout: const Duration(seconds: 12),
        headers: const {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await Get.find<SecureStorageService>().getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
  }

  void updateBaseUrl(String baseUrl) {
    dio.options.baseUrl = baseUrl;
  }
}
