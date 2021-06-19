import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work_test/pages/study/StudyScreen.dart';
import 'package:work_test/services/services.dart';

class CreateStudyController extends GetxController {
  File image;
  var base64Image;
  var getToken = GetSharedPreferences.getToken(key: "token");
  final picker = ImagePicker();
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  int userId;
  @override
  void onInit() async {
    super.onInit();
    print("Create Studies Controller Created");
    var token = await getToken;
    var user = await AuthServices.userVerify(token: token);
    userId = user.result.data.id;
    print(userId);
    update();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      var bytesImage = image.readAsBytesSync();
      base64Image = base64Encode(bytesImage);
    } else {
      print('No image selected.');
    }
    update();
  }

  void createStudies() async {
    var token = await getToken;
    // print("${title.text} ${content.text} $userId");
    var res = await FetchData.createStudies(
        content: content.text, title: title.text, token: token, userId: userId);
    if (res != null) {
      Get.off(() => StudyScreen());
    }
    print(res);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
