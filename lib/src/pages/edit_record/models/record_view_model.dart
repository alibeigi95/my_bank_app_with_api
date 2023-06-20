import 'package:my_bank_app_network/src/pages/my_bank_home/models/account_view_model.dart';
import 'package:my_bank_app_network/src/pages/shared/model/record_type.dart';

class RecordViewModel {
  final int id;
  final RecordType type;
  final int amount;
  final AccountViewModel account;

  RecordViewModel({
    required this.id,
    required this.type,
    required this.amount,
    required this.account,
  });

  factory RecordViewModel.fromJson(final Map<String, dynamic> json) {
    return RecordViewModel(
        id: json['id'],
        type: RecordType.getRecordTypeFromValue(json['type']),
        account: AccountViewModel.fromJson(json['account']),
        amount: json['amount']);
  }
}
