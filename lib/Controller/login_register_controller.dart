import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/Helper/services.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/Model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRegisterController extends GetxController {
  TextEditingController txtEmailLogin = TextEditingController();
  TextEditingController txtPasswordLogin = TextEditingController();

  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtContact = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  RxList<String> errors = RxList<String>();

  String noPass = "Password cannot be empty";
  String shortPass = "Password cannot be shorter than 6 characters ";
  String noEmail = "Email cannot be empty";
  String invalidEmail = "Invalid email address";
  String invalidContact = "Invalid contact number";
  String noContact = "Contact number cannot be empty";
  String noName = "Name cannot be empty";

  RxList<String> errorsOTP = RxList<String>();

  String invalidPin = "Invalid pin code";
  String noPin = "Pin code cannot be empty";

  RxBool loading = false.obs;
  RxBool loadingRegister = false.obs;

  Future<void> login(String? username, String? password) async {
    if (!loading.value) {
      try {
        loading.value = true;

        SharedPreferences pref = await SharedPreferences.getInstance();

        var body = {
          "username": username ?? txtEmailLogin.text,
          "password": password ?? txtPasswordLogin.text
        };

        await ApiRequest.postRequest(baseURL + '/token', body)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() ==
                  "Incorrect username or password") {
                showSnackbarError('Invalid Credentials',
                    'Please enter valid email and password to continue');
              } else {
                if (value["access_token"] != null) {
                  tokenKey = value["access_token"];
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString('token', value["access_token"]);
                }

                loadDataController.userModel.value =
                    userModelFromJson(value['detail']);
                await loadDataController.setUserDetails();

                // loadDataController.userData.value =
                //     userDataFromJson(value['data']);
                // await loadDataController.setUserDetails(true);
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loading.value = false;
      }
    }
  }

  Future<void> register() async {
    if (!loadingRegister.value) {
      try {
        loadingRegister.value = true;

        SharedPreferences pref = await SharedPreferences.getInstance();

        var body = {
          "name": txtName.text,
          "email": txtEmail.text,
          "contact": txtContact.text,
          "meetingCal": "weekly",
          "eventCal": "monthly",
          "newMeetingsOnHome": true,
          "newMessagesOnHome": true,
          "newMessageNotifications": true,
          "newMeetingNotifications": true,
          "requested": [],
          "added": [],
          "password": txtPassword.text
        };

        await ApiRequest.postRequest(baseURL + '/users/CreateUser', body)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() == "Email already registered") {
                showSnackbarError('Email registered',
                    'Email already registered, please login');
              } else {
                login(txtEmail.text, txtPassword.text);
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingRegister.value = false;
      }
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
