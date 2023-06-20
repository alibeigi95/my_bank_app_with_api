import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank_app_network/src/pages/my_bank_home/views/widgets/card_account.dart';
import 'package:my_bank_app_network/src/pages/my_bank_home/views/widgets/labeled_divider.dart';
import 'package:my_bank_app_network/src/pages/my_bank_home/views/widgets/record_item.dart';
import '../controller/my_bank_home_page_controller.dart';

class HomePageRecordsList extends GetView<HomePageRecordListController> {
  const HomePageRecordsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
            title: const Text('Main Page My Bank'),
            backgroundColor: Colors.green[300]),
        body: Column(
          children: [
            _listViewAccount(),
            const LabeledDivider(
              label: 'Record',
            ),
            _listViewRecords(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.goToAddPage(context);
          },
          backgroundColor: Colors.green[300],
          child: const Icon(Icons.add, size: 35),
        ),
      );

  Expanded _listViewRecords() {
    return Expanded(
            child: Obx(
              () => ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.records.length,
                  itemBuilder: (context, index) => RecordItem(
                        record: controller.records[index],
                        index: index,
                      )),
            ),
          );
  }

  Widget _listViewAccount() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.accounts.length,
            itemBuilder: (context, index) =>
                CardAccount(account: controller.accounts[index], color: Colors.green.shade100,),
          ),
        ),
      );
}
