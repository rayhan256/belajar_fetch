import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/pages/auth/AuthController.dart';
import 'package:work_test/ui/SizeConfig.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key key}) : super(key: key);
  AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.username,
                decoration: InputDecoration(hintText: "Username"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.password,
                obscureText: true,
                decoration: InputDecoration(hintText: "Password"),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  controller.userLogin();
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
