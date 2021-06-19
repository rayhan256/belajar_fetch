import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/pages/study_detail/StudyDetailController.dart';
import 'package:work_test/ui/SizeConfig.dart';

class UpdateStudyScreen extends StatelessWidget {
  UpdateStudyScreen({Key key}) : super(key: key);
  StudyDetailController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<StudyDetailController>(
          init: StudyDetailController(),
          builder: (val) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Update Studies",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                    controller: controller.title,
                    decoration: InputDecoration(hintText: "Title"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                    controller: controller.content,
                    decoration: InputDecoration(hintText: "Content"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  child: RaisedButton(
                    onPressed: () {
                      // controller.createStudies();
                      controller.updateStudies();
                    },
                    color: Colors.blue,
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
