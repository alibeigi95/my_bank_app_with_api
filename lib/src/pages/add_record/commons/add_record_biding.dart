import 'package:get/get.dart';
import '../controller/add_record_controller.dart';

class AddRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddRecordController>(
      () => AddRecordController(),
    );
  }
}
