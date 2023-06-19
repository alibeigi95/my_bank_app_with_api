import 'package:flutter/material.dart';

import '../../../shared/model/record_type.dart';



class RecordStatusChip extends StatelessWidget {
  final RecordType status;

  const RecordStatusChip({
    required this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: status.backgroundColor,
        border: Border.all(
          color: status.borderColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          status.name,
          style: TextStyle(
            color: status.borderColor,
          ),
        ),
      ),
    );
  }
}