import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank_app_network/src/pages/my_bank_home/models/record_view_model.dart';
import 'package:my_bank_app_network/src/pages/my_bank_home/views/widgets/record_status.dart';
import '../../controller/my_bank_home_page_controller.dart';

class RecordItem extends GetView<HomePageRecordListController> {
  const RecordItem({super.key, required this.record,required this.index,});

  final RecordViewModel record;
  final int index ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
           controller.goToEditPage(record.id);
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(2, 2),
                )
              ],
              borderRadius: BorderRadius.circular(4),
              color: Theme.of(context).scaffoldBackgroundColor),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(record.account.name),
                  RecordStatusChip(status: record.type),
                ],
              ),
              Text(
                controller.getRecordAmount(record),
              ),
            ],
            /*children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _recordAccountNameText(),
                    // _editRecordButton(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _recordAmountText(recordTypeSign, recordTypeColor),
                    _recordTypeBadge(recordTypeColor, recordType),
                  ],
                ),
              )
            ],*/
          ),
        ),
      ),
    );
  }

  Widget _recordTypeBadge(Color recordTypeColor, String recordType) =>
      DecoratedBox(
        decoration: BoxDecoration(
            color: recordTypeColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: recordTypeColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Text(
            recordType,
            style: TextStyle(color: recordTypeColor),
          ),
        ),
      );

  Widget _recordAccountNameText() {
    return Text(
      record.account.name,
      style: const TextStyle(
          color: Colors.green,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal),
    );
  }

  Widget _recordAmountText(String recordTypeSign, Color recordTypeColor) =>
      Text(
        '$recordTypeSign ${record.amount}',
        style: TextStyle(
            color: recordTypeColor,
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal),
      );


}
