import '../shared_preferences_flutter.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
