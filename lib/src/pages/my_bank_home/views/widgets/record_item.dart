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
           controller.goToEditPage(record);
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



}
