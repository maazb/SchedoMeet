import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/Helper/services.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/Model/event_model.dart';
import 'package:bit_planner/Model/events_model.dart';
import 'package:bit_planner/Model/meeting_model.dart';
import 'package:bit_planner/Model/user_model.dart';
import 'package:bit_planner/Model/user_name_model.dart';
import 'package:bit_planner/View/Startup/welcome.dart';
import 'package:bit_planner/View/bottom_navigator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/common_widgets/snackbar_success.dart';

class LoadDataController extends GetxController {
  static LoadDataController instance = LoadDataController();
  Rx<UserModel> userModel = UserModel().obs;
  RxList<UserNameModel> userNameList = RxList<UserNameModel>();
  String email = "";

  RxBool loadingDelete = false.obs;
  RxBool loading = false.obs;
  RxBool loadingUsers = false.obs;
  RxBool loadingUser = false.obs;

  getData() async {
    await loadDataController.loadMeetings();
    await loadDataController.loadEvents();
    print("length: " + loadDataController.eventsList.length.toString());
    // await _messagesController
    //     .getChat()
    //     .then((value) async => _messagesController.searchList.value =
    //         _messagesController.chatList.where((p0) => true).toList())
    //     .then((value) async => await _messagesController.getChatDates());
  }

  RxList<EventModel> eventList = RxList<EventModel>();

  RxList<EventsModel> eventsList = RxList<EventsModel>();
  RxList<MeetingModel> meetingsList = RxList<MeetingModel>();
  RxList<MeetingModel> unseenMeetingsList = RxList<MeetingModel>();
  RxBool loadingEvents = false.obs;
  RxBool loadingNewMeetings = false.obs;
  RxBool loadingMessages = false.obs;

  Future<void> loadEvents() async {
    if (!loadingEvents.value) {
      try {
        loadingEvents.value = true;

        // var body = {
        //   "username": username ?? txtEmailLogin.text,
        //   "password": password ?? txtPasswordLogin.text
        // };

        int uId = loadDataController.userModel.value.id!;
        String date = DateTime.now().toIso8601String().substring(0, 10);

        await ApiRequest.getRequest(
                baseURL + '/event/GetEventsByUser?date=$date&userId=$uId',
                () {})
            .then((value) async {
          if (value != null) {
            eventsList.value = eventsModelFromJson(value);
            print("GoingHere");
            print(value);

            // if (value["detail"] == "Not authenticated") {
            //   showSnackbarError(
            //       "Error", "Access unauthorized, please login again");
            //   Get.offAll(() => Welcome());
            // }

          }
        });
      } catch (e) {
      } finally {
        loadingEvents.value = false;
      }
    }
  }

  Future<void> loadMeetings() async {
    if (!loadingNewMeetings.value) {
      try {
        loadingNewMeetings.value = true;

        // var body = {
        //   "username": username ?? txtEmailLogin.text,
        //   "password": password ?? txtPasswordLogin.text
        // };

        int uId = loadDataController.userModel.value.id!;
        String date = DateTime.now().toIso8601String().substring(0, 10);

        await ApiRequest.getRequest(
                baseURL + '/meeting/GetMeetingsByUser?date=$date&userId=$uId',
                () {})
            .then((value) async {
          if (value != null) {
            meetingsList.value = meetingModelFromJson(value);
            unseenMeetingsList.value =
                meetingsList.value.where((e) => e.seen == false).toList();
            print("GoingHere");
            print(value);

            // if (value["detail"] == "Not authenticated") {
            //   showSnackbarError(
            //       "Error", "Access unauthorized, please login again");
            //   Get.offAll(() => Welcome());
            // }

          }
        });
      } catch (e) {
      } finally {
        loadingNewMeetings.value = false;
      }
    }
  }

  Future<void> loadAppData() async {
    try {
      if (!loading.value) {
        loading(true);

        SharedPreferences pref = await SharedPreferences.getInstance();

        bool isLogin = pref.getBool('isLoggedIn') ?? false;
        if (isLogin) {
          await loadDataController.loadData();
        } else {
          //Go to Welcome Page

          Get.offAll(() => Welcome());
        }
      }
    } catch (e) {
      print('Error Caught $e');
    } finally {
      loading(false);
    }
  }

  Future<void> loadData() async {
    if (!loadingUser.value) {
      try {
        loadingUser.value = true;

        final fcmToken = await FirebaseMessaging.instance.getToken();

        SharedPreferences pref = await SharedPreferences.getInstance();

        tokenKey = pref.getString("access_token")!;
        int uid = pref.getInt("userId")!;

        var body = {
          // "username": username ?? txtEmailLogin.text,
          // "password": password ?? txtPasswordLogin.text
        };

        var body2 = {};

        await ApiRequest.getRequest(baseURL + '/users/$uid', () {})
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
        loadingUser.value = false;
      }
    }
  }

  Future<void> loadUser() async {
    if (!loadingUser.value) {
      try {
        loadingUser.value = true;

        // final fcmToken = await FirebaseMessaging.instance.getToken();

        // SharedPreferences pref = await SharedPreferences.getInstance();

        // tokenKey = pref.getString("access_token")!;
        // int uid = pref.getInt("userId")!;

        var body = {
          // "username": username ?? txtEmailLogin.text,
          // "password": password ?? txtPasswordLogin.text
        };

        var body2 = {};

        await ApiRequest.getRequest(
                baseURL + '/users/${loadDataController.userModel.value.id}',
                () {})
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() ==
                  "Incorrect username or password") {
                showSnackbarError('Invalid Credentials',
                    'Please enter valid email and password to continue');
              } else {
                loadDataController.userModel.value = userModelFromJson(value);
                await loadDataController.setUserDetails2();
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingUser.value = false;
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
    pref.setBool("isLoggedIn", true);

    Get.offAll(() => BottomNavigator());
  }

  setUserDetails2() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("userId", userModel.value.id!);
    pref.setString("email", userModel.value.email!);
    pref.setString("name", userModel.value.name!);
    pref.setBool("isLoggedIn", true);
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
