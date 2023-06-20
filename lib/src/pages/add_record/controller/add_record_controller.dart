import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_bank_app_network/src/pages/add_record/models/account_view_model.dart';
import 'package:my_bank_app_network/src/pages/add_record/repositories/add_record_repository.dart';

import '../../shared/model/record_type.dart';
import '../models/add_record_dto.dart';

class AddRecordController extends GetxController {
  Rx<RecordType> recordTypeGroup = RecordType.expense.obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController recordAmountController = TextEditingController();
  List<AccountViewModel> accounts = [];
  Rxn<AccountViewModel> selectedAccount = Rxn();
  final AddRecordRepository _repository = AddRecordRepository();

  RxBool isGetAccountsLoading = true.obs, isSubmitLoading = false.obs;



  @override
  void onInit() {
    super.onInit();
    getAccounts();
  }

  Future<void> getAccounts() async {
    isGetAccountsLoading.value = true;
    accounts.clear();
    final result = await _repository.getAccounts();
    accounts.addAll(result);
    selectedAccount.value = accounts.first;
    isGetAccountsLoading.value = false;
  }

  void onRecordSelected(RecordType status) {
    recordTypeGroup.value = status;
  }

  void onAccountSelected(AccountViewModel? account) {
    selectedAccount.value = account;
  }

  Future<void> onSubmit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final dto = _generateAddRecordDto();
    isSubmitLoading.value = true;
    final recordId = await _repository.addRecord(addRecordDto: dto);
    isSubmitLoading.value = false;
    Get.back(result: {
      'id': recordId,
      'type': dto.type,
      'amount': dto.amount,
      'account': {
        'id': selectedAccount.value!.id,
        'name': selectedAccount.value!.name
      },
    });
  }

  AddRecordDto _generateAddRecordDto() => AddRecordDto(
    type: recordTypeGroup.value,
    amount: int.parse(recordAmountController.text),
    accountId: selectedAccount.value!.id,
  );


}
