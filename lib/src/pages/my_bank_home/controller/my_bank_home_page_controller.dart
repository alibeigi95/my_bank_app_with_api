import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_bank_app_network/src/pages/my_bank_home/models/account_view_model.dart';
import 'package:my_bank_app_network/src/pages/my_bank_home/models/record_view_model.dart';
import 'package:my_bank_app_network/src/pages/my_bank_home/repositories/bank_record_list_repositoriy.dart';

import '../../../infrastructure/routes/route_names.dart';
import '../../shared/model/record_type.dart';

class HomePageRecordListController extends GetxController {
  RxList<AccountViewModel> accounts = RxList();
  RxList<RecordViewModel> records = RxList();
  final BankRecordListRepository _repository = BankRecordListRepository();

  @override
  void onInit() {
    super.onInit();
    getRecords();
    getAccounts();
  }

  Future<void> getRecords() async {
    final result = await _repository.getRecords();
    records.addAll(result);
  }

  Future<void> getAccounts() async {
    accounts.clear();
    final result = await _repository.getAccounts();
    accounts.addAll(result);
  }

  String getRecordAmount(final RecordViewModel record) {
    if (record.type == RecordType.expense) {
      return '- IRR ${record.amount}';
    } else if (record.type == RecordType.income) {
      return '+ IRR ${record.amount}';
    }
    return '';
  }

  Future<void> goToAddPage(BuildContext context) async {
    final result = await Get.toNamed<dynamic>(
        '${RouteName.myBankHomePage}${RouteName.addBankRecord}');

    final bool isRecordAdded = result != null;

    if (isRecordAdded) {
      getAccounts();
      final account = result['account'];
      records.add(RecordViewModel(
          id: result['id'],
          type: result['type'],
          amount: result['amount'],
          account: AccountViewModel(
              id: account['id'], name: account['name'], balance: 0)));
    }
  }

  Future<void> goToEditPage(int index) async {
    final result = await Get.toNamed(
        RouteName.myBankHomePage + RouteName.editBankRecord,
        arguments: index);
    if (result != null) {
      records[index] = result;
    }
  }
}
