import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/Helper/services.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/Model/user_model.dart';
import 'package:bit_planner/Model/user_name_model.dart';
import 'package:bit_planner/View/Startup/welcome.dart';
import 'package:bit_planner/View/bottom_navigator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/common_widgets/snackbar_success.dart';

class LoadDataController extends GetxController {
  static LoadDataController instance = LoadDataController();
  Rx<UserModel> userModel = UserModel().obs;
  RxList<UserNameModel> userNameList = RxList<UserNameModel>();
  String email = "";

  RxBool loadingDelete = false.obs;

  Future<void> deleteMeeting(int meetingId) async {
    if (!loadingDelete.value) {
      try {
        loadingDelete.value = true;

        int uId = userModel.value.id!;

        var body = {};

        await ApiRequest.deleteRequest(
                baseURL + '/meeting/DeleteMeeting?id=${meetingId}')
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() == "Not authenticated") {
                Get.to(() => Welcome);
                showSnackbarError(
                    'Access expired', 'Please login again to continue');
              } else {
                Get.back();

                showSnackbarSuccess("Success", "Meeting deleted.");
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingDelete.value = false;
      }
    }
  }

  Future<void> deleteEvent(int eventId) async {
    if (!loadingDelete.value) {
      try {
        loadingDelete.value = true;

        int uId = userModel.value.id!;

        var body = {};

        await ApiRequest.deleteRequest(
                baseURL + '/event/DeleteEvent?id=${eventId}')
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() == "Not authenticated") {
                Get.to(() => Welcome);
                showSnackbarError(
                    'Access expired', 'Please login again to continue');
              } else {
                Get.back();

                showSnackbarSuccess("Success", "Event deleted.");
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingDelete.value = false;
      }
    }
  }

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
