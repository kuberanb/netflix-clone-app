
import 'package:get/get.dart';
import 'package:netflix/api_services/downloads_services_repo_impl.dart';
import 'package:netflix/controllers/fast_laugh_controller.dart';

class FastLaughBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(DownloadsRepo());
    Get.put(FastLaughController());
  }



}