import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/account_view_model.dart';
import '../models/edit_record_dto.dart';
import '../models/record_view_model.dart';


class EditBankRecordListRepository {
  final httpClient = http.Client();

  String _localhost() {
    return '10.0.2.2:3000';
  }


  Map<String, String> customHeaders = {"content-type": "application/json"};
  Future<int> editRecord({required EditRecordDto dto}) async {
    final url = Uri.http(_localhost(), 'record/${dto.id}');
    final jsonDto = dto.toJson();
    final response = await http.put(
      url,
      body: json.encode(jsonDto),
      headers: customHeaders,
    );
    try {
      if (response.statusCode == 200) {
        return json.decode((response.body));
      }
    } catch (e) {
      print('error');
    }
    return -1;
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

  Future<List<EditAccountViewModel>> getAccounts() async {
    final url = Uri.http(_localhost(), 'accounts');
    final response = await httpClient.get(url);
    final List<EditAccountViewModel> accounts = [];
    try {
      for (final account in json.decode(response.body)) {
        accounts.add(EditAccountViewModel.fromJson(account));
      }
    } catch (e) {
      print('error');
    }
    return accounts;
  }
}
