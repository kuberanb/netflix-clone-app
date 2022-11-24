
import 'package:get/get.dart';
import 'package:netflix/api_services/search_services.dart';
import 'package:netflix/api_services/search_services_impl.dart';
import 'package:netflix/controllers/downloads_controller.dart';
import 'package:netflix/controllers/search_controller.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SearchServiceImpl());
  Get.put(SearchController());
 // Get.put(DownloadsController());
    // TODO: implement dependencies
  }

}