import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/pages/create_study/CreateStudyScreen.dart';
import 'package:work_test/pages/study/StudyController.dart';
import 'package:work_test/pages/study_detail/StudyDetailScreen.dart';
import 'package:work_test/ui/SizeConfig.dart';

// ignore: must_be_immutable
class StudyScreen extends StatelessWidget {
  StudyScreen({Key key}) : super(key: key);
  StudyController controller = Get.put(StudyController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("List Of Study"),
      ),
      body: GetBuilder<StudyController>(
        initState: (_) => controller.getAllStudies(),
        builder: (val) {
          return Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: val.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      for (var data in val.studies)
                        StudyCard(
                          content: data.content,
                          title: data.title,
                          image: data.image,
                          id: data.id,
                        )
                    ],
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateStudyScreen());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class StudyCard extends StatelessWidget {
  const StudyCard({Key key, this.image, this.title, this.content, this.id})
      : super(key: key);
  final String image;
  final String title;
  final String content;
  final int id;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth,
      child: GestureDetector(
        onTap: () {
          Get.to(() => StudyDetailScreen(
                id: id,
              ));
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(image),
                  radius: 80,
                ),
              ),
              Container(
                width: 200,
                child: Column(
                  children: [
                    Text(title),
                    Text(content),
                  ],
                ),
              ),
            ],
          ),
          Divider()
        ]),
      ),
    );
  }
}
