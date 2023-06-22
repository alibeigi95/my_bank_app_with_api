import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../shared/model/record_type.dart';
import '../models/account_view_model.dart';
import '../models/edit_record_dto.dart';
import '../repositories/edit_bank_record_list_repositoriy.dart';

class EditRecordController extends GetxController {
  RxBool isGetAccountsLoading = true.obs, isSubmitLoading = false.obs;
  Rx<RecordType> recordTypeGroup = RecordType.income.obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  List<EditAccountViewModel> accounts = [];
  TextEditingController recordAmountController = TextEditingController();
  int? selectRecordID;
  int accountViewModelSelect = 0;
  Rxn<EditAccountViewModel> selectedAccount = Rxn();
  final EditBankRecordListRepository _repository =
      EditBankRecordListRepository();

  @override
  void onInit() {
    getAccounts();
    recordAmountController.text = Get.arguments['amount'].toString();
    recordTypeGroup.value = Get.arguments['type'];
    accountViewModelSelect = Get.arguments['account'];
    selectRecordID = Get.arguments['id'];
    super.onInit();
  }

  Future<void> getAccounts() async {
    isGetAccountsLoading.value = true;
    accounts.clear();
    final result = await _repository.getAccounts();
    accounts.addAll(result);
    if (accountViewModelSelect == 0) {
      selectedAccount.value = accounts.first;
    } else {
      selectedAccount.value = accounts.last;
    }
    isGetAccountsLoading.value = false;
  }

  void onRecordSelected(RecordType status) {
    recordTypeGroup.value = status;
  }

  void onAccountSelected(EditAccountViewModel? account) {
    selectedAccount.value = account;
  }



  Future<void> edit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final dto = _generateEditRecordDto();
    isSubmitLoading.value = true;
    final recordId = (await _repository.editRecord(dto: dto));
    isSubmitLoading.value = false;
    Get.back(result: {
      'id':selectRecordID ,
      'type': dto.type,
      'amount': dto.amount,
      'account': {
        'id': selectedAccount.value!.id,
        'name': selectedAccount.value!.name
      },
    });
  }

  EditRecordDto _generateEditRecordDto() => EditRecordDto(
        type: recordTypeGroup.value,
        amount: int.parse(recordAmountController.text),
        accountId: selectedAccount.value!.id,
        id: selectRecordID!,
      );


}
