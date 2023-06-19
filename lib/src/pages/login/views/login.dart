import 'package:flutter/material.dart';
import 'package:my_bank_app_network/src/pages/login/views/widgets/my_custom_login.dart';




class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(title: const Text('login to my bank'),backgroundColor: Colors.green[300]),
        body:const MyCustomLogin(),
        backgroundColor: Colors.green[100],
      );
}
