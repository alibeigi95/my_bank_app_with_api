import '../../shared/model/record_type.dart';

class AddRecordDto {
  final RecordType type;
  final int amount;
  final int accountId;

  AddRecordDto({
    required this.type,
    required this.amount,
    required this.accountId,
  });

  Map<String, dynamic> toJson() => {
    'type': type.value,
    'amount': amount,
    'accountId': accountId,
  };
}