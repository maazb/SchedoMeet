import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/Helper/services.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/Model/events_model.dart';
import 'package:bit_planner/Model/meeting_model.dart';
import 'package:bit_planner/View/Startup/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MeetingController extends GetxController {
  Rx<DateTime>? startDate = DateTime.now().obs;
  Rx<DateTime>? endDate = DateTime.now().obs;
  Rx<TimeOfDay>? startTime = TimeOfDay.now().obs;
  Rx<TimeOfDay>? endTime = TimeOfDay.now().obs;
  TextEditingController txtStartDate = TextEditingController();
  TextEditingController txtEndDate = TextEditingController();

  TextEditingController txtStartTime = TextEditingController();
  TextEditingController txtEndTime = TextEditingController();

  RxBool loading = false.obs;
  RxInt selectedMonthIndex = 7.obs;
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
