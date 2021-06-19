import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:work_test/pages/study/StudyScreen.dart';
import 'package:work_test/services/services.dart';

class AuthController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  var getToken = GetSharedPreferences.getToken(key: "token");
  bool isLoading = false;

  @override
  void onInit() async {
    super.onInit();
    print("Auth Controller mounted");
    var token = await getToken;
    if (token != null) {
      Get.off(StudyScreen());
    }
  }

  void userLogin() async {
    var res = await AuthServices.userLogin(
        username: username.text, password: password.text);
    if (res == null) {
      Get.snackbar("error", "Wrong Username / Password",
          backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      SetSharedPreferences().setToken(token: res['result']);
      Get.off(StudyScreen());
      // print(res['result']);
    }
  }
}
