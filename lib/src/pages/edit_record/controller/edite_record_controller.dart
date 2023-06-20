import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../shared/model/record_type.dart';
import '../../shared/model/record_type.dart';
import '../models/account_view_model.dart';
import '../models/record_view_model.dart';
import '../repositories/edit_bank_record_list_repositoriy.dart';


class EditRecordController extends GetxController {
  RxBool isGetAccountsLoading = true.obs, isSubmitLoading = false.obs;
  int recordIndex = Get.arguments;
  Rx<RecordType> recordTypeGroup = RecordType.income.obs;
  GlobalKey<FormState>? formKey;
  RxList<RecordViewModel> records = RxList();
  List<AccountViewModel> accounts = [];
  TextEditingController recordAmountController = TextEditingController();

  Rxn<AccountViewModel> selectedAccount = Rxn();
  final EditBankRecordListRepository _repository = EditBankRecordListRepository();

  @override
  void onInit() {
    formKey = GlobalKey();
    getRecords();
    getAccounts();
    final RecordViewModel record = records[recordIndex];
    recordAmountController.text = '${record.amount}';
    if (record.type.name == 'expense') {
      recordTypeGroup.value = RecordType.expense;
    } else if (record.type.name == 'income') {
      recordTypeGroup.value = RecordType.income;
    }
   /* if (record.account.name == 'A') {
      selectedAccount.value = accounts.first;
    } else if (record.account.name == 'B') {
      selectedAccount.value = accounts.last ;
    }*/
    super.onInit();
  }

  Future<void> getRecords() async {
    final result = await _repository.getRecords();
    records.addAll(result);
  }
  Future<void> getAccounts()async{
    accounts.clear();
    final result = await _repository.getAccounts();
    accounts.addAll(result);
  }

  void onRecordSelected(RecordType status) {
    recordTypeGroup.value = status;
  }

  void onAccountSelected(AccountViewModel? account) {
    selectedAccount.value = account;
  }

  void edit(){
  Get.back();
}
/*

  void submitRecord() {
    if (formKey?.currentState?.validate() ?? false) {
      editRecord();
    }
  }

  void editRecord() {
    final Account account =
        DataBank.bank.accounts[accountChoiceGroupValue.value];
    final double amount = double.parse(recordAmountController.text);
    PaymentRecord editPaymentRecord = DataBank.bank.records[recordIndex];
    PaymentRecord? editPaymentRecords;
    switch (recordTypeGroup.value) {
      case RecordTypeEnum.incomeRecord:
        if (editPaymentRecord.runtimeType == IncomeRecord) {
          editPaymentRecords =
              _editIncomeRecordToIncome(editPaymentRecord, account, amount);
        } else {
          editPaymentRecords =
              _editExpenseRecordToIncom(editPaymentRecord, account, amount);
        }
      case RecordTypeEnum.expenseRecord:
        if (editPaymentRecord.runtimeType == IncomeRecord) {
          if (editPaymentRecord.relatedAccount == account) {
            if ((editPaymentRecord.relatedAccount.balanceAccount -
                    editPaymentRecord.amount) >
                amount) {
              editPaymentRecord.relatedAccount.balanceAccount -=
                  editPaymentRecord.amount;
              DataBank.bank.records.removeAt(recordIndex);
              ExpenseRecord expenseRecord = ExpenseRecord(
                  account:
                      DataBank.bank.accounts[accountChoiceGroupValue.value],
                  amount: double.parse(recordAmountController.text));
              DataBank.bank.records.insert(recordIndex, expenseRecord);
              account.balanceAccount -= amount;
              editPaymentRecords = expenseRecord;
            } else {
              // return 'Not enough money to edit this record';
            }
          } else {
            if (editPaymentRecord.relatedAccount.balanceAccount >
                    editPaymentRecord.amount &&
                account.balanceAccount > amount) {
              editPaymentRecord.relatedAccount.balanceAccount -=
                  editPaymentRecord.amount;
              DataBank.bank.records.removeAt(recordIndex);
              ExpenseRecord expenseRecord = ExpenseRecord(
                  account:
                      DataBank.bank.accounts[accountChoiceGroupValue.value],
                  amount: double.parse(recordAmountController.text));
              DataBank.bank.records.insert(recordIndex, expenseRecord);
              account.balanceAccount -= amount;
              editPaymentRecords = expenseRecord;
            } else {
              //return 'Not enough money to edit this record';
            }
          }
        } else {
          if (editPaymentRecord.relatedAccount == account) {
            if ((editPaymentRecord.relatedAccount.balanceAccount +
                    editPaymentRecord.amount) >
                amount) {
              editPaymentRecord.relatedAccount.balanceAccount +=
                  editPaymentRecord.amount;
              DataBank.bank.records.removeAt(recordIndex);
              ExpenseRecord expenseRecord = ExpenseRecord(
                  account:
                      DataBank.bank.accounts[accountChoiceGroupValue.value],
                  amount: double.parse(recordAmountController.text));
              DataBank.bank.records.insert(recordIndex, expenseRecord);
              account.balanceAccount -= amount;
              editPaymentRecords = expenseRecord;
            } else {
              // return 'Not enough money to edit this record';
            }
          }
        }
    }
    Get.back(result: editPaymentRecords);
  }

  PaymentRecord _editExpenseRecordToIncom(
      PaymentRecord editPaymentRecord, Account account, double amount) {
    editPaymentRecord.relatedAccount.balanceAccount += editPaymentRecord.amount;
    DataBank.bank.records.removeAt(recordIndex);
    IncomeRecord incomeRecord = IncomeRecord(
        account: DataBank.bank.accounts[accountChoiceGroupValue.value],
        amount: double.parse(recordAmountController.text));
    DataBank.bank.records.insert(recordIndex, incomeRecord);
    account.balanceAccount += amount;
    return incomeRecord;
  }

  PaymentRecord _editIncomeRecordToIncome(
      PaymentRecord editPaymentRecord, Account account, double amount) {
    editPaymentRecord.relatedAccount.balanceAccount -= editPaymentRecord.amount;
    DataBank.bank.records.removeAt(recordIndex);
    IncomeRecord incomeRecord = IncomeRecord(
        account: DataBank.bank.accounts[accountChoiceGroupValue.value],
        amount: double.parse(recordAmountController.text));
    DataBank.bank.records.insert(recordIndex, incomeRecord);
    account.balanceAccount += amount;
    return incomeRecord;
  }
*/

}
