import 'package:bit_planner/Model/user_model.dart';
import 'package:bit_planner/View/Startup/welcome.dart';
import 'package:bit_planner/View/bottom_navigator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadDataController extends GetxController {
  static LoadDataController instance = LoadDataController();
  Rx<UserModel> userModel = UserModel().obs;

  setUserDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("userId", userModel.value.id!);
    pref.setString("email", userModel.value.email!);
    pref.setString("name", userModel.value.name!);

    Get.offAll(() => BottomNavigator());
  }

  Future<void> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Get.offAll(() => Welcome());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
