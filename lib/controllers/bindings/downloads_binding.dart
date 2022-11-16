
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:netflix/api_services/downloads_services_repo_impl.dart';
import 'package:netflix/controllers/downloads_controller.dart';

class DownloadsBinding extends Bindings{

  @override
  void dependencies() {
  Get.put(DownloadsRepo());
  Get.put(DownloadsController());

  }
  
}