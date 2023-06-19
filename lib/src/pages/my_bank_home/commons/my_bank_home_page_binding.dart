import 'package:get/get.dart';
import '../controller/my_bank_home_page_controller.dart';


class HomePageRecordListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageRecordListController());
  }
}
