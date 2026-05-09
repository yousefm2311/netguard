import 'package:get/get.dart';
import '../presentation/controllers/main_controller.dart';
import '../../settings/presentation/controllers/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => SettingsController(), fenix: true);
    // Future controllers will be injected here
  }
}
