import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank_app_network/src/pages/add_record/views/widgets/acount_selector.dart';

import 'package:my_bank_app_network/src/pages/add_record/views/widgets/record_selector.dart';
import '../../../infrastructure/theme/my_theme.dart';
import '../controller/add_record_controller.dart';

class AddRecord extends GetView<AddRecordController> {
  const AddRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add record'),
        backgroundColor: Colors.green[300],
      ),
      backgroundColor: Colors.green[100],
      body: Column(
        children: [
          const RecordSelector(),
          _amount(),
          const AccountSelector(),
          _submit(),
        ],
      ),
    );
  }

  Widget _amount() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: controller.formKey,
          child: TextFormField(
            controller: controller.recordAmountController,
            validator: (input) {
              if (input == null || input.isEmpty) {
                return 'JIIIIIIIIIIIGH';
              }

              return null;
            },
          ),
        ),
      );

  Widget _submit() => Obx(
        () => controller.isSubmitLoading.value
            ? _submitLoading()
            : ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: controller.onSubmit,
                child: const Text('Submit'),
              ),
      );

  Widget _submitLoading() => const DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: CircularProgressIndicator(),
      );
}
