import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank_app_network/src/infrastructure/routes/route_names.dart';
import 'package:my_bank_app_network/src/infrastructure/routes/route_pages.dart';

class MyBankApp extends StatelessWidget {
  const MyBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my bank app',
      initialRoute:RouteName.loginPage,
      getPages: RoutePages.pages,
    );
  }
}
