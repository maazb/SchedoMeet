import 'dart:io';

import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/Helper/common_widgets/snackbar_success.dart';
import 'package:bit_planner/Helper/services.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/Model/setting_model.dart';
import 'package:bit_planner/Model/user_model.dart';
import 'package:bit_planner/Model/user_name_model.dart';
import 'package:bit_planner/View/Startup/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AccountController extends GetxController {
  RxList<SettingModel> settingsList = RxList<SettingModel>();
  RxList<UserNameModel> requestList = RxList<UserNameModel>();
  RxList<UserNameModel> searchPeopleList = RxList<UserNameModel>();

  final storage = FirebaseStorage.instance;

  // RxList<UserNameModel> requestList = RxList<UserNameModel>();
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
  RxBool loadingRequests = false.obs;
  RxBool loadingSearch = false.obs;

  RxBool loadingAcceptReq = false.obs;

  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtNewPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  TextEditingController txtNameInfo = TextEditingController();
  TextEditingController txtEmailInfo = TextEditingController();
  TextEditingController txtPhoneInfo = TextEditingController();

  TextEditingController txtSearchUser = TextEditingController();

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

  Future<void> acceptRequest(int from, int to) async {
    if (!loadingAcceptReq.value) {
      try {
        loadingAcceptReq.value = true;

        Rx<UserModel> tempUser = UserModel().obs;
        Rx<UserModel> myUser = loadDataController.userModel.value.obs;

        await ApiRequest.getRequest(baseURL + '/users/${to}', () {})
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              tempUser.value = userModelFromJson(value);
            }
          }
        });

        tempUser.value.requested!.remove(from);
        tempUser.value.added!.add(from);
        myUser.value.added!.add(to);

        var body1 = {
          "name": tempUser.value.name,
          "email": tempUser.value.email,
          "contact": tempUser.value.contact,
          "image": tempUser.value.image,
          "fcmId": tempUser.value.fcmId,
          "meetingCal": tempUser.value.meetingCal,
          "eventCal": tempUser.value.eventCal,
          "newMeetingsOnHome": tempUser.value.newMeetingsOnHome,
          "newMessagesOnHome": tempUser.value.newMessagesOnHome,
          "newMessageNotifications": tempUser.value.newMessageNotifications,
          "newMeetingNotifications": tempUser.value.newMeetingNotifications,
          "requested": [
            for (int i = 0; i < tempUser.value.requested!.length; i++)
              tempUser.value.requested![i],
          ],
          "added": [
            for (int i = 0; i < tempUser.value.added!.length; i++)
              tempUser.value.added![i],
          ]
        };

        var body2 = {
          "name": myUser.value.name,
          "email": myUser.value.email,
          "contact": myUser.value.contact,
          "image": myUser.value.image,
          "fcmId": myUser.value.fcmId,
          "meetingCal": myUser.value.meetingCal,
          "eventCal": myUser.value.eventCal,
          "newMeetingsOnHome": myUser.value.newMeetingsOnHome,
          "newMessagesOnHome": myUser.value.newMessagesOnHome,
          "newMessageNotifications": myUser.value.newMessageNotifications,
          "newMeetingNotifications": myUser.value.newMeetingNotifications,
          "requested": [
            for (int i = 0; i < myUser.value.requested!.length; i++)
              myUser.value.requested![i],
          ],
          "added": [
            for (int i = 0; i < myUser.value.added!.length; i++)
              myUser.value.added![i],
          ]
        };

        await ApiRequest.putRequest(baseURL + '/users/EditUser?id=${to}', body1)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() ==
                  "Incorrect username or password") {
                showSnackbarError('Invalid Credentials',
                    'Please enter valid current passowrd to continue');
              } else {
                await ApiRequest.putRequest(
                        baseURL + '/users/EditUser?id=${from}', body2)
                    .then((value) async {
                  if (value != null) {
                    print(value);

                    if (value != null) {
                      if (value['detail'].toString() ==
                          "Incorrect username or password") {
                        showSnackbarError('Invalid Credentials',
                            'Please enter valid current passowrd to continue');
                      } else {
                        await getRequests();
                        loadDataController.loadUser();

                        showSnackbarSuccess(
                            "Success", "Request accepted successfully");
                      }
                    }
                  }
                });
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingAcceptReq.value = false;
      }
    }
  }

  Future<void> removePeople(int from, int to) async {
    if (!loadingAcceptReq.value) {
      try {
        loadingAcceptReq.value = true;

        Rx<UserModel> tempUser = UserModel().obs;
        Rx<UserModel> myUser = loadDataController.userModel.value.obs;

        await ApiRequest.getRequest(baseURL + '/users/${to}', () {})
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              tempUser.value = userModelFromJson(value);
            }
          }
        });

        // tempUser.value.requested!.remove(from);
        tempUser.value.added!.remove(from);
        myUser.value.added!.remove(to);

        var body1 = {
          "name": tempUser.value.name,
          "email": tempUser.value.email,
          "contact": tempUser.value.contact,
          "image": tempUser.value.image,
          "fcmId": tempUser.value.fcmId,
          "meetingCal": tempUser.value.meetingCal,
          "eventCal": tempUser.value.eventCal,
          "newMeetingsOnHome": tempUser.value.newMeetingsOnHome,
          "newMessagesOnHome": tempUser.value.newMessagesOnHome,
          "newMessageNotifications": tempUser.value.newMessageNotifications,
          "newMeetingNotifications": tempUser.value.newMeetingNotifications,
          "requested": [
            for (int i = 0; i < tempUser.value.requested!.length; i++)
              tempUser.value.requested![i],
          ],
          "added": [
            for (int i = 0; i < tempUser.value.added!.length; i++)
              tempUser.value.added![i],
          ]
        };

        var body2 = {
          "name": myUser.value.name,
          "email": myUser.value.email,
          "contact": myUser.value.contact,
          "image": myUser.value.image,
          "fcmId": myUser.value.fcmId,
          "meetingCal": myUser.value.meetingCal,
          "eventCal": myUser.value.eventCal,
          "newMeetingsOnHome": myUser.value.newMeetingsOnHome,
          "newMessagesOnHome": myUser.value.newMessagesOnHome,
          "newMessageNotifications": myUser.value.newMessageNotifications,
          "newMeetingNotifications": myUser.value.newMeetingNotifications,
          "requested": [
            for (int i = 0; i < myUser.value.requested!.length; i++)
              myUser.value.requested![i],
          ],
          "added": [
            for (int i = 0; i < myUser.value.added!.length; i++)
              myUser.value.added![i],
          ]
        };

        await ApiRequest.putRequest(baseURL + '/users/EditUser?id=${to}', body1)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() ==
                  "Incorrect username or password") {
                showSnackbarError('Invalid Credentials',
                    'Please enter valid current passowrd to continue');
              } else {
                await ApiRequest.putRequest(
                        baseURL + '/users/EditUser?id=${from}', body2)
                    .then((value) async {
                  if (value != null) {
                    print(value);

                    if (value != null) {
                      if (value['detail'].toString() ==
                          "Incorrect username or password") {
                        showSnackbarError('Invalid Credentials',
                            'Please enter valid current passowrd to continue');
                      } else {
                        await getRequests();
                        loadDataController.loadUser();

                        showSnackbarSuccess(
                            "Success", "User removed successfully");
                      }
                    }
                  }
                });
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingAcceptReq.value = false;
      }
    }
  }

  Future<void> denyRequest(int from, int to) async {
    if (!loadingAcceptReq.value) {
      try {
        loadingAcceptReq.value = true;

        Rx<UserModel> tempUser = UserModel().obs;
        Rx<UserModel> myUser = loadDataController.userModel.value.obs;

        await ApiRequest.getRequest(baseURL + '/users/${to}', () {})
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              tempUser.value = userModelFromJson(value);
            }
          }
        });

        tempUser.value.requested!.remove(from);
        // tempUser.value.added!.add(from);
        // myUser.value.added!.add(to);

        var body1 = {
          "name": tempUser.value.name,
          "email": tempUser.value.email,
          "contact": tempUser.value.contact,
          "image": tempUser.value.image,
          "fcmId": tempUser.value.fcmId,
          "meetingCal": tempUser.value.meetingCal,
          "eventCal": tempUser.value.eventCal,
          "newMeetingsOnHome": tempUser.value.newMeetingsOnHome,
          "newMessagesOnHome": tempUser.value.newMessagesOnHome,
          "newMessageNotifications": tempUser.value.newMessageNotifications,
          "newMeetingNotifications": tempUser.value.newMeetingNotifications,
          "requested": [
            for (int i = 0; i < tempUser.value.requested!.length; i++)
              tempUser.value.requested![i],
          ],
          "added": [
            for (int i = 0; i < tempUser.value.added!.length; i++)
              tempUser.value.added![i],
          ]
        };

        // var body2 = {
        //   "name": myUser.value.name,
        //   "email": myUser.value.email,
        //   "contact": myUser.value.contact,
        //   "image": myUser.value.image,
        //   "meetingCal": myUser.value.meetingCal,
        //   "eventCal": myUser.value.eventCal,
        //   "newMeetingsOnHome": myUser.value.newMeetingsOnHome,
        //   "newMessagesOnHome": myUser.value.newMessagesOnHome,
        //   "newMessageNotifications": myUser.value.newMessageNotifications,
        //   "newMeetingNotifications": myUser.value.newMeetingNotifications,
        //   "requested": [
        //     for (int i = 0; i < myUser.value.requested!.length; i++)
        //       myUser.value.requested![i],
        //   ],
        //   "added": [
        //     for (int i = 0; i < myUser.value.added!.length; i++)
        //       myUser.value.added![i],
        //   ]
        // };

        await ApiRequest.putRequest(baseURL + '/users/EditUser?id=${to}', body1)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() ==
                  "Incorrect username or password") {
                showSnackbarError('Invalid Credentials',
                    'Please enter valid current passowrd to continue');
              } else {
                await getRequests();
                //loadDataController.userModel.value = userModelFromJson(value);
                loadDataController.loadUser();

                showSnackbarSuccess("Success", "Request denied successfully");
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingAcceptReq.value = false;
      }
    }
  }

  Future<void> addRequest(int from, int to) async {
    if (!loadingAcceptReq.value) {
      try {
        loadingAcceptReq.value = true;

        Rx<UserModel> tempUser = UserModel().obs;
        Rx<UserModel> myUser = loadDataController.userModel.value.obs;

        // await ApiRequest.getRequest(baseURL + '/users/${to}', () {})
        //     .then((value) async {
        //   if (value != null) {
        //     print(value);

        //     if (value != null) {
        //       tempUser.value = userModelFromJson(value);
        //     }
        //   }
        // });

        // tempUser.value.requested!.remove(from);
        // tempUser.value.added!.remove(from);
        myUser.value.requested!.add(to);

        // var body1 = {
        //   "name": tempUser.value.name,
        //   "email": tempUser.value.email,
        //   "contact": tempUser.value.contact,
        //   "image": tempUser.value.image,
        //   "meetingCal": tempUser.value.meetingCal,
        //   "eventCal": tempUser.value.eventCal,
        //   "newMeetingsOnHome": tempUser.value.newMeetingsOnHome,
        //   "newMessagesOnHome": tempUser.value.newMessagesOnHome,
        //   "newMessageNotifications": tempUser.value.newMessageNotifications,
        //   "newMeetingNotifications": tempUser.value.newMeetingNotifications,
        //   "requested": [
        //     for (int i = 0; i < tempUser.value.requested!.length; i++)
        //       tempUser.value.requested![i],
        //   ],
        //   "added": [
        //     for (int i = 0; i < tempUser.value.added!.length; i++)
        //       tempUser.value.added![i],
        //   ]
        // };

        var body2 = {
          "name": myUser.value.name,
          "email": myUser.value.email,
          "contact": myUser.value.contact,
          "image": myUser.value.image,
          "fcmId": myUser.value.fcmId,
          "meetingCal": myUser.value.meetingCal,
          "eventCal": myUser.value.eventCal,
          "newMeetingsOnHome": myUser.value.newMeetingsOnHome,
          "newMessagesOnHome": myUser.value.newMessagesOnHome,
          "newMessageNotifications": myUser.value.newMessageNotifications,
          "newMeetingNotifications": myUser.value.newMeetingNotifications,
          "requested": [
            for (int i = 0; i < myUser.value.requested!.length; i++)
              myUser.value.requested![i],
          ],
          "added": [
            for (int i = 0; i < myUser.value.added!.length; i++)
              myUser.value.added![i],
          ]
        };

        await ApiRequest.putRequest(
                baseURL + '/users/EditUser?id=${from}', body2)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() ==
                  "Incorrect username or password") {
                showSnackbarError('Invalid Credentials',
                    'Please enter valid current passowrd to continue');
              } else {
                await getRequests();
                loadDataController.loadUser();

                showSnackbarSuccess("Success", "Request added successfully");
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingAcceptReq.value = false;
      }
    }
  }

  Future<void> removeRequest(int from, int to) async {
    if (!loadingAcceptReq.value) {
      try {
        loadingAcceptReq.value = true;

        Rx<UserModel> tempUser = UserModel().obs;
        Rx<UserModel> myUser = loadDataController.userModel.value.obs;

        // await ApiRequest.getRequest(baseURL + '/users/${to}', () {})
        //     .then((value) async {
        //   if (value != null) {
        //     print(value);

        //     if (value != null) {
        //       tempUser.value = userModelFromJson(value);
        //     }
        //   }
        // });

        // tempUser.value.requested!.remove(from);
        // tempUser.value.added!.remove(from);
        myUser.value.requested!.remove(to);

        // var body1 = {
        //   "name": tempUser.value.name,
        //   "email": tempUser.value.email,
        //   "contact": tempUser.value.contact,
        //   "image": tempUser.value.image,
        //   "meetingCal": tempUser.value.meetingCal,
        //   "eventCal": tempUser.value.eventCal,
        //   "newMeetingsOnHome": tempUser.value.newMeetingsOnHome,
        //   "newMessagesOnHome": tempUser.value.newMessagesOnHome,
        //   "newMessageNotifications": tempUser.value.newMessageNotifications,
        //   "newMeetingNotifications": tempUser.value.newMeetingNotifications,
        //   "requested": [
        //     for (int i = 0; i < tempUser.value.requested!.length; i++)
        //       tempUser.value.requested![i],
        //   ],
        //   "added": [
        //     for (int i = 0; i < tempUser.value.added!.length; i++)
        //       tempUser.value.added![i],
        //   ]
        // };

        var body2 = {
          "name": myUser.value.name,
          "email": myUser.value.email,
          "contact": myUser.value.contact,
          "image": myUser.value.image,
          "fcmId": myUser.value.fcmId,
          "meetingCal": myUser.value.meetingCal,
          "eventCal": myUser.value.eventCal,
          "newMeetingsOnHome": myUser.value.newMeetingsOnHome,
          "newMessagesOnHome": myUser.value.newMessagesOnHome,
          "newMessageNotifications": myUser.value.newMessageNotifications,
          "newMeetingNotifications": myUser.value.newMeetingNotifications,
          "requested": [
            for (int i = 0; i < myUser.value.requested!.length; i++)
              myUser.value.requested![i],
          ],
          "added": [
            for (int i = 0; i < myUser.value.added!.length; i++)
              myUser.value.added![i],
          ]
        };

        await ApiRequest.putRequest(
                baseURL + '/users/EditUser?id=${from}', body2)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              if (value['detail'].toString() ==
                  "Incorrect username or password") {
                showSnackbarError('Invalid Credentials',
                    'Please enter valid current passowrd to continue');
              } else {
                await getRequests();
                loadDataController.loadUser();

                showSnackbarSuccess("Success", "Request removed successfully");
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingAcceptReq.value = false;
      }
    }
  }

  Future<void> searchUsers() async {
    if (!loadingSearch.value) {
      try {
        loadingSearch.value = true;

        // var body = {
        //   "username": loadDataController.email,
        //   "password": txtPassword.text,
        //   "newPassword": txtNewPassword.text
        // };

        int uId = loadDataController.userModel.value.id!;
        String query = txtSearchUser.text;

        await ApiRequest.getRequest(
                baseURL + '/users/Search?query=${query}', () {})
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              searchPeopleList.value = userNameModelFromJson(value);
            }
          }
        });
      } catch (e) {
      } finally {
        loadingSearch.value = false;
      }
    }
  }

  Future<void> getRequests() async {
    if (!loadingRequests.value) {
      try {
        loadingRequests.value = true;

        // var body = {
        //   "username": loadDataController.email,
        //   "password": txtPassword.text,
        //   "newPassword": txtNewPassword.text
        // };

        int uId = loadDataController.userModel.value.id!;

        await ApiRequest.getRequest(
                baseURL + '/users/Requests?uId=${uId}', () {})
            .then((value) async {
          if (value != null) {
            print(value);

            if (value != null) {
              requestList.value = userNameModelFromJson(value);
            }
          }
        });
      } catch (e) {
      } finally {
        loadingRequests.value = false;
      }
    }
  }

  Future<void> editProfile() async {
    if (!loadingUpdateInfo.value) {
      try {
        loadingUpdateInfo.value = true;
        String imageUrl = "";

        final storageRef = FirebaseStorage.instance.ref();

// Create a reference to "mountains.jpg"
        final imagesRef =
            storageRef.child("images/${selectedImage.value.name}");
        File file = File(selectedImage.value.path);
        try {
          print("Uploading to Firebase");
          await imagesRef.putFile(file);
          imageUrl = await imagesRef.getDownloadURL();
        } on FirebaseException catch (e) {
          print("firebase exception: $e");
        }

        //Upload Images
        // List<String> imagesString = [];
        // imagesString.add(selectedImage.value.path);
        // print("inagestring: $imagesString");

        // String profilePic = '';

        // if (imagesString.isNotEmpty) {
        //   await ApiRequest.uploadImages(selectedImage.value.path).then(
        //     (value) {
        //       if (value != null) {
        //         profilePic = value[0]['path'].toString();
        //       }
        //     },
        //   );
        // }

        var body = {
          "name": txtNameInfo.text,
          "email": txtEmailInfo.text,
          "contact": txtPhoneInfo.text,
          "image": imageUrl != ""
              ? imageUrl
              : loadDataController.userModel.value.image,
          "fcmId": loadDataController.userModel.value.fcmId,
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
                await loadDataController.setUserDetails2();
                Get.back();
                showSnackbarSuccess("Success", "Profile updated successfully");
              }
            }
          }
        });
      } catch (e) {
        print("exception: $e");
      } finally {
        loadingUpdateInfo.value = false;
      }
    }
  }

  Future<void> logOut() async {
    if (!loadingUpdateInfo.value) {
      try {
        loadingUpdateInfo.value = true;

// Create a reference to "mountains.jpg"

        //Upload Images
        // List<String> imagesString = [];
        // imagesString.add(selectedImage.value.path);
        // print("inagestring: $imagesString");

        // String profilePic = '';

        // if (imagesString.isNotEmpty) {
        //   await ApiRequest.uploadImages(selectedImage.value.path).then(
        //     (value) {
        //       if (value != null) {
        //         profilePic = value[0]['path'].toString();
        //       }
        //     },
        //   );
        // }

        var body = {
          "name": loadDataController.userModel.value.name,
          "email": loadDataController.userModel.value.email,
          "contact": loadDataController.userModel.value.contact,
          "image": loadDataController.userModel.value.image,
          "fcmId": "",
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
                Get.offAll(() => Welcome());
                showSnackbarSuccess("Success", "Logged out successfully");
              }
            }
          }
        });
      } catch (e) {
        print("exception: $e");
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
        SettingModel(name: "Privacy policy", icon: "assets/icons/Shield.svg"));

    settingsList.add(
        SettingModel(name: "About us", icon: "assets/icons/Info-circle.svg"));

    settingsList
        .add(SettingModel(name: "Sign out", icon: "assets/icons/Logout.svg"));
  }
}
