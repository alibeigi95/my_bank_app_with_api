import 'package:flutter/material.dart';

import '../../../shared/model/record_type.dart';


class RecordSelectorItem extends StatelessWidget {
  final RecordType status;
  final RecordType groupStatus;
  final void Function(RecordType status) onPressed;

  const RecordSelectorItem({
    required this.status,
    required this.groupStatus,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            onPressed(status);
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color:
                  status == groupStatus ? Colors.deepPurple : Colors.blueGrey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(status.name),
                ],
              ),
            ),
          ),
        ),
      );
}