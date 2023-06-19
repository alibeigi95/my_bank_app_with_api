import 'package:flutter/material.dart';

enum RecordType {
  expense(
    value: 2,
    name: 'expense',
    backgroundColor: Color(0xffFFEBF0),
    borderColor: Colors.redAccent,
  ),
  income(
    value: 1,
    name: 'income',
    backgroundColor: Color(0xffF2F7E8),
    borderColor: Colors.green,
  ),
  none(
    value: 0,
    name: 'none',
    backgroundColor: Color(0xffF2F7E8),
    borderColor: Colors.green,
  );

  const RecordType({
    required this.value,
    required this.name,
    required this.backgroundColor,
    required this.borderColor,
  });

  final int value;
  final String name;
  final Color backgroundColor;
  final Color borderColor;

  static RecordType getRecordTypeFromValue(int value) {
    if (value == 1) return RecordType.income;
    if (value == 2) return RecordType.expense;
    return RecordType.none;
  }
}