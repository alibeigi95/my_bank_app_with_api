import '../../shared/model/record_type.dart';

class EditRecordDto {
  final RecordType type;
  final int amount;
  final int accountId;
  final int id;

  EditRecordDto(
      {required this.type,
      required this.amount,
      required this.accountId,
      required this.id});

  Map<String, dynamic> toJson() => {
        'type': type.value,
        'amount': amount,
        'accountId': accountId,

      };
}
