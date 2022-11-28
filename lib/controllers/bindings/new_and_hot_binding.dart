
import 'package:get/get.dart';
import 'package:netflix/api_services/hot_and_new_service_impl.dart';
import 'package:netflix/controllers/new_and_hot_controller.dart';

class NewAndHotBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NewAndHotController());
    Get.put(HotAndNewServiceImpl());
    // TODO: implement dependencies
  }

}