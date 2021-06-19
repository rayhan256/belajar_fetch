import 'package:get/get.dart';
import 'package:work_test/services/services.dart';

class StudyController extends GetxController {
  var getToken = GetSharedPreferences.getToken(key: "token");
  List studies;
  bool isLoading = false;
  @override
  void onInit() async {
    super.onInit();
    print("Study Controller Mounted");
    getAllStudies();
  }

  void getAllStudies() async {
    isLoading = true;
    var token = await getToken;
    var res = await FetchData.getAllStudies(token: token);
    studies = res.result.data;
    isLoading = false;
    update();
  }
}
