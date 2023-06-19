import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';



class LoginController extends GetxController{
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late final TextEditingController userNameTextController, passWordController;
  RxBool obscureText = true.obs;

  @override
  void onInit() {
    super.onInit();
    userNameTextController = TextEditingController();
    passWordController = TextEditingController();
  }


  @override
  void onClose() {
    userNameTextController.dispose();
    passWordController.dispose();
  }

  String? validateUserName(String value) {
    if (value.isEmpty || value.length < 3) {
      return "Password must be of 3 characters";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    Get.offAndToNamed(RouteName.myBankHomePage);
  }

}