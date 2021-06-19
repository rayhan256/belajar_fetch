import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work_test/pages/study/StudyScreen.dart';
import 'package:work_test/services/services.dart';

class StudyDetailController extends GetxController {
  var getToken = GetSharedPreferences.getToken(key: "token");
  var study;
  bool isLoading = false;
  var idContent;
  int userId;
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  File image;
  var base64Image;
  final picker = ImagePicker();
  @override
  void onInit() async {
    super.onInit();
    var token = await getToken;
    var user = await AuthServices.userVerify(token: token);
    userId = user.result.data.id;
    print(userId);
  }

  void studyDetail({int id}) async {
    isLoading = true;
    idContent = id;
    var token = await getToken;
    var res = await FetchData.getStudiesById(id: id, token: token);
    study = res.result;
    print(study);
    isLoading = false;
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

  void updateStudies() async {
    var token = await getToken;
    var res = await FetchData.updateStudies(
        content: content.text,
        title: title.text,
        token: token,
        id: idContent,
        userId: userId);

    if (res != null) {
      Get.off(() => StudyScreen());
    }
  }
}
