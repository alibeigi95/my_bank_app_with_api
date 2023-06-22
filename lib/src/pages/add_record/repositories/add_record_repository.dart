import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_bank_app_network/src/pages/add_record/models/account_view_model.dart';
import 'package:my_bank_app_network/src/pages/add_record/models/add_record_dto.dart';

class AddRecordRepository {
  final httpClient = http.Client();

  String _localhost() {
    return '10.0.2.2:3000';
  }

  Future<List<AccountViewModel>> getAccounts() async {
    final url = Uri.http(_localhost(), 'accounts');
    final response = await http.get(url);
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

  Map<String, String> customHeaders = {"content-type": "application/json"};
  Future<int> addRecord({required AddRecordDto addRecordDto}) async {
    final url = Uri.http(_localhost(), 'record');
    final jsonDto = addRecordDto.toJson();
    final response = await http.post(
      url,
      body: json.encode(jsonDto),
      headers: customHeaders,
    );
    try {
      if (response.statusCode == 200) {
        return json.decode((response.body))['id'];
      }
    } catch (e) {
      print('error');
    }
    return -1;
  }

}
