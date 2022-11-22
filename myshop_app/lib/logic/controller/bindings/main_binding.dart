import 'package:get/instance_manager.dart';
import 'package:myshop_app/logic/controller/main_controller.dart';
import 'package:myshop_app/logic/controller/setting_controller.dart';

class MainBininding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
  }
}
