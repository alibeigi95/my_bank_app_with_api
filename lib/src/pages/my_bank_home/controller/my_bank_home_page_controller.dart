import 'package:get/get.dart';
import 'package:my_bank_app_network/src/pages/my_bank_home/models/account_view_model.dart';
import 'package:my_bank_app_network/src/pages/my_bank_home/models/record_view_model.dart';
import 'package:my_bank_app_network/src/pages/my_bank_home/repositories/bank_record_list_repositoriy.dart';

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

  Future<void> getAccounts()async{
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

 /* Future<void> goToAddPage() async {
    final result = await Get.toNamed(
        RoutesName.homePageRecordsList + RoutesName.addRecord);
    if (result != null) {
      records.add(result);
    }
  }

  Future<void> goToEditPage(int index) async {
    final result = await Get.toNamed(
        RoutesName.homePageRecordsList + RoutesName.editRecord,
        arguments: index);
    if (result != null) {
      records[index] = result;
    }
  }*/

}
