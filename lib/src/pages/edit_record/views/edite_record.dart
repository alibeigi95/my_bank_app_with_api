import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank_app_network/src/pages/edit_record/views/widgets/acount_selector.dart';
import 'package:my_bank_app_network/src/pages/edit_record/views/widgets/record_selector.dart';
import '../../../infrastructure/theme/my_theme.dart';
import '../controller/edite_record_controller.dart';

class EditRecord extends GetView<EditRecordController> {
  const EditRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('edit record'),
        backgroundColor: Colors.green[300],
      ),
      backgroundColor: Colors.green[100],
      body: Column(
        children: [
          const RecordSelector(),
          _amount(),
          const AccountSelector(),
          _edit(),
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

  Widget _edit() => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        onPressed: controller.edit,
        child: const Text('Edit'),
      );
}
