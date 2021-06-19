import 'package:get/get.dart';
import 'package:work_test/services/services.dart';
import 'package:work_test/pages/auth/AuthScreen.dart';

class StudyController extends GetxController {
  var getToken = GetSharedPreferences.getToken(key: "token");
  List studies;
  bool isLoading = false;
  var userId;

  @override
  void onInit() async {
    super.onInit();
    print("Study Controller Mounted");
    var token = await getToken;
    // var user = await AuthServices.userVerify(token: token);
    // if (user == null) {
    //   Get.off(() => AuthScreen());
    // }
    getAllStudies();
  }

  void getAllStudies() async {
    isLoading = true;
    var token = await getToken;
    var res = await FetchData.getAllStudies(token: token);
    studies = res.result.data;
    if (studies == null) {
      Get.off(() => AuthScreen());
    }
    isLoading = false;
    update();
  }
}
