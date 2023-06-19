import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_bank_app_network/src/pages/my_bank_home/models/account_view_model.dart';
import 'package:my_bank_app_network/src/pages/my_bank_home/models/record_view_model.dart';

class BankRecordListRepository {
  final httpClient = http.Client();

  String _localhost() {
    return '10.0.2.2:3000';
  }

  Future<List<RecordViewModel>> getRecords() async {
    final url = Uri.http(_localhost(), 'records');
    final response = await httpClient.get(url);
    final List<RecordViewModel> records = [];
    try {
      for (final record in json.decode(response.body)) {
        records.add(RecordViewModel.fromJson(record));
      }
    } catch (e) {
      print('error');
    }
    return records;
  }

  Future<List<AccountViewModel>> getAccounts() async {
    final url = Uri.http(_localhost(), 'accounts');
    final response = await httpClient.get(url);
    final List<AccountViewModel> accounts = [];
    try {
      for (final account in json.decode(response.body)) {
        accounts.add(AccountViewModel.fromJson(account));
      }
    } catch (e) {
      print('error');
    }

    return accounts;
  }
}
