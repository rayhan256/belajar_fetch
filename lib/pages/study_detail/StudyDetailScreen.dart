import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/pages/study_detail/StudyDetailController.dart';
import 'package:work_test/pages/study_detail/UpdateStudyScreen.dart';
import 'package:work_test/ui/SizeConfig.dart';

class StudyDetailScreen extends StatelessWidget {
  StudyDetailScreen({Key key, this.id}) : super(key: key);
  int id;
  StudyDetailController controller = Get.put(StudyDetailController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Back",
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: GetBuilder<StudyDetailController>(
          initState: (_) => controller.studyDetail(id: id),
          builder: (val) {
            return val.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(val.study.image),
                        radius: 80,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        val.study.title,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        val.study.content,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Get.to(() => UpdateStudyScreen());
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
