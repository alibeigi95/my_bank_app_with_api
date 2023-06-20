import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/edite_record_controller.dart';
import 'account_selector_item.dart';

class AccountSelector extends GetView<EditRecordController> {
  const AccountSelector({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (controller.isGetAccountsLoading.value)
              const CircularProgressIndicator()
            else
              ...accounts(),
          ],
        ),
      );

  List<Widget> accounts() => [
        AccountSelectorItem(
          account: controller.accounts.first,
          groupAccount: controller.selectedAccount.value!,
          onPressed: controller.onAccountSelected,
        ),
        AccountSelectorItem(
          account: controller.accounts[1],
          groupAccount: controller.selectedAccount.value!,
          onPressed: controller.onAccountSelected,
        ),
      ];
}