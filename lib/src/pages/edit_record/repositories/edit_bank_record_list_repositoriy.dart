import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/account_view_model.dart';
import '../models/record_view_model.dart';


class EditBankRecordListRepository {
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
