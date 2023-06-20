import 'package:get/get.dart';
import '../controller/edite_record_controller.dart';

class EditRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditRecordController>(
          () => EditRecordController(),
    );
  }
}