import 'package:flutter/material.dart';

import '../../models/account_view_model.dart';




class AccountSelectorItem extends StatelessWidget {
  final AccountViewModel account;
  final AccountViewModel groupAccount;
  final void Function(AccountViewModel? account) onPressed;
  const AccountSelectorItem({
    required this.account,
    required this.groupAccount,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Radio(
            value: account,
            groupValue: groupAccount,
            onChanged: onPressed,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8.0),
            child: Text(account.name),
          ),
        ],
      );
}