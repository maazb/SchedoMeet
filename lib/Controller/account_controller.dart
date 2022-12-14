import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/Helper/common_widgets/snackbar_success.dart';
import 'package:bit_planner/Helper/services.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/Model/setting_model.dart';
import 'package:bit_planner/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class AccountController extends GetxController {
  RxList<SettingModel> settingsList = RxList<SettingModel>();
  String noOldPass = "Current password cannot be empty";
  String noNewPass = "New password cannot be empty";
  String noPassMatch = "Passwords do not match";
  String shortPass = "Password cannot be shorter than 6 characters ";

  String noEmail = "Email cannot be empty";
  String invalidEmail = "Invalid email address";
  String invalidContact = "Invalid contact number";
  String noContact = "Contact number cannot be empty";
  String noName = "Name cannot be empty";

  RxBool loadingUpdatePassword = false.obs;
  RxBool loadingUpdateInfo = false.obs;

  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtNewPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  TextEditingController txtNameInfo = TextEditingController();
  TextEditingController txtEmailInfo = TextEditingController();
  TextEditingController txtPhoneInfo = TextEditingController();

  var selectedImage = XFile('path').obs;
  var selectedCover = XFile('path').obs;
  RxString path = ''.obs;
  RxString coverPath = ''.obs;
  final ImagePicker picker = ImagePicker();

  //TextEditingController txtWebsite = TextEditingController();

  Future<void> selectImageSource(ImageSource imageSource, String type) async {
    try {
      XFile? image = await picker.pickImage(source: imageSource);
      if (type == 'cover') {
        selectedCover.value = image!;
      } else {
        selectedImage.value = image!;
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<void> editProfile() async {
    if (!loadingUpdateInfo.value) {
      try {
        loadingUpdateInfo.value = true;

        //Upload Images
        List<String> imagesString = [];
        imagesString.add(selectedImage.value.path);
        print("inagestring: $imagesString");

        String profilePic = '';

        if (imagesString.isNotEmpty) {
          await ApiRequest.uploadImages(selectedImage.value.path).then(
            (value) {
              if (value != null) {
                profilePic = value[0]['path'].toString();
              }
            },
          );
        }

        var body = {
          "name": txtNameInfo.text,
          "email": txtEmailInfo.text,
          "contact": txtPhoneInfo.text,
          "image": profilePic != ""
              ? profilePic
              : loadDataController.userModel.value.image,
          "meetingCal": loadDataController.userModel.value.meetingCal,
          "eventCal": loadDataController.userModel.value.eventCal,
          "newMeetingsOnHome":
              loadDataController.userModel.value.newMeetingsOnHome,
          "newMessagesOnHome":
              loadDataController.userModel.value.newMessagesOnHome,
          "newMessageNotifications":
              loadDataController.userModel.value.newMessageNotifications,
          "newMeetingNotifications":
              loadDataController.userModel.value.newMeetingNotifications,
          "requested": [
            for (int i = 0;
                i < loadDataController.userModel.value.requested!.length;
                i++)
              loadDataController.userModel.value.requested![i],
          ],
          "added": [
            for (int i = 0;
                i < loadDataController.userModel.value.added!.length;
                i++)
              loadDataController.userModel.value.added![i],
          ]
        };

        await ApiRequest.putRequest(
                baseURL +
                    '/users/EditUser?id=${loadDataController.userModel.value.id}',
                body)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() ==
                  "Incorrect username or password") {
                showSnackbarError('Invalid Credentials',
                    'Please enter valid current passowrd to continue');
              } else {
                loadDataController.userModel.value = userModelFromJson(value);
                await loadDataController.setUserDetails();
                Get.back();
                showSnackbarSuccess("Success", "Profile updated successfully");
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingUpdateInfo.value = false;
      }
    }
  }

  Future<void> updatePassowrd() async {
    if (!loadingUpdatePassword.value) {
      try {
        loadingUpdatePassword.value = true;

        var body = {
          "username": loadDataController.email,
          "password": txtPassword.text,
          "newPassword": txtNewPassword.text
        };

        await ApiRequest.postRequest(baseURL + '/users/UpdatePassword', body)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() ==
                  "Incorrect username or password") {
                showSnackbarError('Invalid Credentials',
                    'Please enter valid current passowrd to continue');
              } else {
                Get.back();
                showSnackbarSuccess("Success", "Password updated successfully");
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingUpdatePassword.value = false;
      }
    }
  }

  getEvents() {
    settingsList.add(
        SettingModel(name: "App settings", icon: "assets/icons/Settings.svg"));

    settingsList.add(
        SettingModel(name: "Privacy policy", icon: "assets/icons/Shield.svg"));

    settingsList.add(
        SettingModel(name: "About us", icon: "assets/icons/Info-circle.svg"));

    settingsList
        .add(SettingModel(name: "Sign out", icon: "assets/icons/Logout.svg"));
  }
}
