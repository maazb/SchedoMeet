import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/Helper/common_widgets/snackbar_success.dart';
import 'package:bit_planner/Helper/services.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/Model/events_model.dart';
import 'package:bit_planner/Model/meeting_model.dart';
import 'package:bit_planner/Model/recomendation_model.dart';
import 'package:bit_planner/Model/user_name_model.dart';
import 'package:bit_planner/View/Meetings/meeting_failure.dart';
import 'package:bit_planner/View/Startup/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MeetingController extends GetxController {
  TextEditingController txtAddTitle = TextEditingController();
  TextEditingController txtAddDetail = TextEditingController();
  TextEditingController txtAddLink = TextEditingController();
  TextEditingController txtDuration = TextEditingController();

  RxList<UserNameModel> addedUsers = RxList<UserNameModel>();
  RxList<UserNameModel> selectedAttendees = RxList<UserNameModel>();
  RxString selectedCategory = "meeting".obs;

  Rx<DateTime>? endDate = DateTime.now().obs;
  Rx<TimeOfDay>? startTime = TimeOfDay.now().obs;
  Rx<TimeOfDay>? endTime = TimeOfDay.now().obs;
  TextEditingController txtStartDate = TextEditingController();
  TextEditingController txtEndDate = TextEditingController();

  TextEditingController txtStartTime = TextEditingController();
  TextEditingController txtEndTime = TextEditingController();

  RxBool loading = false.obs;
  RxInt selectedMonthIndex = 7.obs;
  RxList<List<DateTime>> recomendationList = RxList<List<DateTime>>();
  RxString selectedMonth =
      DateFormat('MMM yyyy').format(DateTime.now()).toString().obs;
  List<DateTime> monthList = [
    DateTime(2021, 8, 1, 0, 0, 0, 0, 0),
    DateTime(2021, 9, 1, 0, 0, 0, 0, 0),
    DateTime(2021, 10, 1, 0, 0, 0, 0, 0),
    DateTime(2021, 11, 1, 0, 0, 0, 0, 0),
    DateTime(2021, 12, 1, 0, 0, 0, 0, 0),
    DateTime(2022, 1, 1, 0, 0, 0, 0, 0),
    DateTime(2022, 2, 1, 0, 0, 0, 0, 0),
    DateTime(2022, 3, 1, 0, 0, 0, 0, 0),
    DateTime(2022, 4, 1, 0, 0, 0, 0, 0),
  ];
  RxList<int> selectedTimeSlots = RxList<int>();

  Rx<DateTime>? focusedDay = DateTime.now().obs;
  Rx<DateTime>? focusedDay1 = DateTime.now().obs;
  Rx<DateTime>? selectedDay = DateTime.now().obs;
  void onMonthChange(int index) {
    selectedMonthIndex.value = index;
    selectedMonth.value = DateFormat('MMM yyyy').format(monthList[index]);
  }

  RxList<MeetingModel> meetingList = RxList<MeetingModel>();
  RxBool loadingMeetings = false.obs;
  RxBool loadingNewMeetings = false.obs;
  RxBool loadingMessages = false.obs;

  RxBool loadingAddMeeting = false.obs;

  Future<void> addMeeting() async {
    if (!loadingAddMeeting.value) {
      try {
        loadingAddMeeting.value = true;

        int uId = loadDataController.userModel.value.id!;
        String sdate = selectedDay!.value.toIso8601String().substring(0, 10);
        String edate = endDate!.value.toIso8601String().substring(0, 10);

        String startT = DateTime(
                    selectedDay!.value.year,
                    selectedDay!.value.month,
                    selectedDay!.value.day,
                    startTime!.value.hour,
                    startTime!.value.minute)
                .toIso8601String()
                .substring(0, 19) +
            "Z";

        String endT = DateTime(
                    selectedDay!.value.year,
                    selectedDay!.value.month,
                    selectedDay!.value.day,
                    endTime!.value.hour,
                    endTime!.value.minute)
                .toIso8601String()
                .substring(0, 19) +
            "Z";

        var body = {
          "title": txtAddTitle.text,
          "detail": txtAddDetail.text,
          "meeting_type": selectedCategory.value,
          "start_date": sdate,
          "end_date": edate,
          "start_time": startT,
          "end_time": endT,
          "createdBy": uId,
          "link": txtAddLink.text,
          "attendees": [
            uId,
            for (int i = 0; i < selectedAttendees.length; i++)
              selectedAttendees[i].id,
          ],
          "seen": false
        };

        await ApiRequest.postRequest(baseURL + '/meeting/CreateMeeting', body)
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
                Get.back();
                showSnackbarSuccess("Success", "Meeting added.");
                loadingMeetings();
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingAddMeeting.value = false;
      }
    }
  }

  Future<void> addMeetingOnCommand(DateTime st, DateTime et) async {
    if (!loadingAddMeeting.value) {
      try {
        loadingAddMeeting.value = true;

        int uId = loadDataController.userModel.value.id!;
        String sdate = selectedDay!.value.toIso8601String().substring(0, 10);
        String edate = endDate!.value.toIso8601String().substring(0, 10);

        String startT = DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day, st.hour, st.minute)
                .toIso8601String()
                .substring(0, 19) +
            "Z";

        String endT = DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day, et.hour, et.minute)
                .toIso8601String()
                .substring(0, 19) +
            "Z";

        var body = {
          "title": txtAddTitle.text,
          "detail": txtAddDetail.text,
          "meeting_type": selectedCategory.value,
          "start_date": sdate,
          "end_date": edate,
          "start_time": startT,
          "end_time": endT,
          "createdBy": uId,
          "link": txtAddLink.text,
          "attendees": [
            uId,
            for (int i = 0; i < selectedAttendees.length; i++)
              selectedAttendees[i].id,
          ],
          "seen": false
        };

        await ApiRequest.postRequest(baseURL + '/meeting/CreateMeeting', body)
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
                Get.back();
                Get.back();
                showSnackbarSuccess("Success", "Meeting added.");
                loadMeetings();
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingAddMeeting.value = false;
      }
    }
  }

  Future<void> addMeetingAuto() async {
    if (!loadingAddMeeting.value) {
      try {
        loadingAddMeeting.value = true;

        int uId = loadDataController.userModel.value.id!;
        String sdate = selectedDay!.value.toIso8601String().substring(0, 10);
        String edate = endDate!.value.toIso8601String().substring(0, 10);

        String startT = DateTime(
                    selectedDay!.value.year,
                    selectedDay!.value.month,
                    selectedDay!.value.day,
                    startTime!.value.hour,
                    startTime!.value.minute)
                .toIso8601String()
                .substring(0, 19) +
            "Z";

        String endT = DateTime(
                    selectedDay!.value.year,
                    selectedDay!.value.month,
                    selectedDay!.value.day,
                    endTime!.value.hour,
                    endTime!.value.minute)
                .toIso8601String()
                .substring(0, 19) +
            "Z";

        var body = {
          "title": txtAddTitle.text,
          "detail": txtAddDetail.text,
          "meeting_type": selectedCategory.value,
          "start_date": sdate,
          "end_date": edate,
          "start_time": startT,
          "end_time": endT,
          "createdBy": uId,
          "link": txtAddLink.text,
          "attendees": [
            uId,
            for (int i = 0; i < selectedAttendees.length; i++)
              selectedAttendees[i].id,
          ],
          "seen": false
        };

        int min = int.parse(txtDuration.text);

        await ApiRequest.postRequest(
                baseURL + '/meeting/CreateMeetingAuto?duration=$min', body)
            .then((value) async {
          if (value != null) {
            print(value);

            if (value["status"].toString() == "false") {
              recomendationList.value =
                  recomendationModelFromJson(value["recomended"]);
              print("here");
              Get.to(() => MeetingFailure());
            } else {
              await loadMeetings();

              Get.back();
              Get.back();
            }
          }
        });
      } catch (e) {
      } finally {
        loadingAddMeeting.value = false;
      }
    }
  }

  Future<void> loadMeetings() async {
    if (!loadingMeetings.value) {
      try {
        loadingMeetings.value = true;

        // var body = {
        //   "username": username ?? txtEmailLogin.text,
        //   "password": password ?? txtPasswordLogin.text
        // };

        int uId = loadDataController.userModel.value.id!;
        String date = selectedDay!.value.toIso8601String().substring(0, 10);

        await ApiRequest.getRequest(
                baseURL + '/meeting/GetMeetingsByUser?date=$date&userId=$uId',
                () {})
            .then((value) async {
          if (value != null) {
            print(value);
            meetingList.value = meetingModelFromJson(value);

            // if (value["detail"] == "Not authenticated") {
            //   showSnackbarError(
            //       "Error", "Access unauthorized, please login again");
            //   Get.offAll(() => Welcome());
            // } else {

            // }
          }
        });
      } catch (e) {
      } finally {
        loadingMeetings.value = false;
      }
    }
  }
}
