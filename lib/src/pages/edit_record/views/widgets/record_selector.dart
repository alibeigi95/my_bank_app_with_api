import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank_app_network/src/pages/add_record/views/widgets/record_selector_item.dart';
import '../../../shared/model/record_type.dart';
import '../../controller/edite_record_controller.dart';


class RecordSelector extends GetView<EditRecordController> {
  const RecordSelector({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: RecordSelectorItem(
                onPressed: controller.onRecordSelected,
                status: RecordType.income,
                groupStatus: controller.recordTypeGroup.value,
              ),
            ),
            Expanded(
              child: RecordSelectorItem(
                onPressed: controller.onRecordSelected,
                status: RecordType.expense,
                groupStatus: controller.recordTypeGroup.value,
              ),
            ),
          ],
        ),
      );
}