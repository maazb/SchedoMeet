import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/Helper/common_widgets/snackbar_success.dart';
import 'package:bit_planner/Helper/services.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/Model/user_model.dart';
import 'package:bit_planner/Model/user_name_model.dart';
import 'package:bit_planner/View/Startup/login.dart';
import 'package:bit_planner/View/Startup/otp.dart';
import 'package:bit_planner/View/Startup/welcome.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

  TextEditingController txtEmailForgot = TextEditingController();

  TextEditingController txtOTP = TextEditingController();

  TextEditingController txtNewPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  RxList<String> errors = RxList<String>();

  String noPass = "Password cannot be empty";
  String noPassMatch = "Passwords do not match";
  String shortPass = "Password cannot be shorter than 6 characters ";
  String noEmail = "Email cannot be empty";
  String invalidEmail = "Invalid email address";
  String invalidContact = "Invalid contact number";
  String noContact = "Contact number cannot be empty";
  String noName = "Name cannot be empty";

  RxString receivedOTP = "0000000000".obs;

  String invalidPin = "Invalid pin code";
  String noPin = "Pin code cannot be empty";

  RxBool loading = false.obs;
  RxBool loadingUsers = false.obs;
  RxBool loadingRegister = false.obs;
  RxBool loadingForgotPassword = false.obs;
  RxBool loadingOTP = false.obs;
  RxBool loadingNewPassword = false.obs;

  Future<void> login(String? username, String? password) async {
    if (!loading.value) {
      try {
        loading.value = true;

        final fcmToken = await FirebaseMessaging.instance.getToken();

        SharedPreferences pref = await SharedPreferences.getInstance();

        var body = {
          "username": username ?? txtEmailLogin.text,
          "password": password ?? txtPasswordLogin.text
        };

        var body2 = {};

        await ApiRequest.postRequest(baseURL + '/token', body)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() ==
                  "Incorrect username or password") {
                showSnackbarError('Invalid Credentials',
                    'Please enter valid email and password to continue');
                txtPasswordLogin.clear();
              } else {
                if (value["access_token"] != null) {
                  tokenKey = value["access_token"];
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString('token', value["access_token"]);
                }
                loadDataController.userModel.value =
                    userModelFromJson(value['detail']);
                await loadDataController.setUserDetails2();
                await ApiRequest.putRequest(
                        baseURL +
                            '/users/UpdateFcm?fcmId=${fcmToken}&id=${loadDataController.userModel.value.id}',
                        body2)
                    .then((value) async {
                  if (value != null) {
                    print(value);

                    if (value != null) {
                      if (value['detail'].toString() ==
                          "Incorrect username or password") {
                        showSnackbarError('Invalid Credentials',
                            'Please enter valid email and password to continue');
                      } else {
                        loadDataController.userModel.value =
                            userModelFromJson(value);
                        await loadDataController.setUserDetails();
                        await getUsers();
                        print(
                            "users: ${loadDataController.userNameList.length}");
                      }
                    }
                  }
                });

                // loadDataController.userModel.value =
                //     userModelFromJson(value['detail']);
                // await loadDataController.setUserDetails();
                // await getUsers();
                // print("users: ${loadDataController.userNameList.length}");

                // // loadDataController.userData.value =
                // //     userDataFromJson(value['data']);
                // // await loadDataController.setUserDetails(true);
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

  Future<void> getUsers() async {
    if (!loadingUsers.value) {
      try {
        loadingUsers.value = true;

        // var body = {
        //   "username": loadDataController.email,
        //   "password": txtPassword.text,
        //   "newPassword": txtNewPassword.text
        // };

        await ApiRequest.getRequest(baseURL + '/users/Names', () {})
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              loadDataController.userNameList.value =
                  userNameModelFromJson(value);
            }
          }
        });
      } catch (e) {
      } finally {
        loadingUsers.value = false;
      }
    }
  }

  Future<void> sendOTP() async {
    if (!loadingForgotPassword.value) {
      try {
        loadingForgotPassword.value = true;

        var body = {
          // "username": username ?? txtEmailLogin.text,
          // "password": password ?? txtPasswordLogin.text
        };

        await ApiRequest.postRequest(
                baseURL + '/users/SendOTP?email=${txtEmailForgot.text}', body)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() ==
                  "Incorrect username or password") {
                showSnackbarError('Invalid Credentials',
                    'Please enter valid email to continue');
              } else {
                if (value["otp"] != null) {
                  receivedOTP.value = value["otp"].toString();
                  Get.to(() => OTP());
                }
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingForgotPassword.value = false;
      }
    }
  }

  Future<void> newPassword() async {
    if (!loadingNewPassword.value) {
      try {
        loadingNewPassword.value = true;

        var body = {
          // "username": username ?? txtEmailLogin.text,
          // "password": password ?? txtPasswordLogin.text
        };

        await ApiRequest.postRequest(
                baseURL +
                    '/users/NewPassword?email=${loadDataController.email}&newPassword=${txtNewPassword.text}',
                body)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() ==
                  "Incorrect username or password") {
                showSnackbarError('Invalid Credentials',
                    'Please enter valid email to continue');
              } else {
                Get.offAll(() => Welcome());
                showSnackbarSuccess("Success", "Password updated successfully");
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingNewPassword.value = false;
      }
    }
  }

  Future<void> register() async {
    if (!loadingRegister.value) {
      try {
        loadingRegister.value = true;
        final fcmToken = await FirebaseMessaging.instance.getToken();

        SharedPreferences pref = await SharedPreferences.getInstance();

        var body = {
          "name": txtName.text,
          "email": txtEmail.text,
          "contact": txtContact.text,
          "image": "",
          "fcmId": fcmToken,
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
