import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/Helper/common_widgets/snackbar_success.dart';
import 'package:bit_planner/Helper/services.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/Model/event_model.dart';
import 'package:bit_planner/Model/events_model.dart';
import 'package:bit_planner/Model/user_name_model.dart';
import 'package:bit_planner/View/Startup/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {
  TextEditingController txtAddTitle = TextEditingController();
  TextEditingController txtAddDetail = TextEditingController();
  TextEditingController txtAddLink = TextEditingController();

  RxList<UserNameModel> addedUsers = RxList<UserNameModel>();
  RxList<UserNameModel> selectedAttendees = RxList<UserNameModel>();
  RxString selectedCategory = "event".obs;
  Rx<DateTime>? selectedDay = DateTime.now().obs;
  Rx<DateTime>? endDate = DateTime.now().obs;
  Rx<TimeOfDay>? startTime = TimeOfDay.now().obs;
  Rx<TimeOfDay>? endTime = TimeOfDay.now().obs;
  TextEditingController txtStartDate = TextEditingController();
  TextEditingController txtEndDate = TextEditingController();

  TextEditingController txtStartTime = TextEditingController();
  TextEditingController txtEndTime = TextEditingController();
  RxList<int> selectedTimeSlots = RxList<int>();

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

  Rx<DateTime>? focusedDay = DateTime.now().obs;
  Rx<DateTime>? focusedDay1 = DateTime.now().obs;

  RxList<EventModel> eventList = RxList<EventModel>();

  RxList<EventsModel> eventsList = RxList<EventsModel>();
  RxBool loadingEvents = false.obs;
  RxBool loadingNewMeetings = false.obs;
  RxBool loadingMessages = false.obs;

  RxBool loadingAddEvent = false.obs;

  Future<void> addEvent() async {
    if (!loadingAddEvent.value) {
      try {
        loadingAddEvent.value = true;

        int uId = loadDataController.userModel.value.id!;
        String date = selectedDay!.value.toIso8601String().substring(0, 10);

        String startT = DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    startTime!.value.hour,
                    startTime!.value.minute)
                .toIso8601String()
                .substring(0, 19) +
            "Z";

        String endT = DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    endTime!.value.hour,
                    endTime!.value.minute)
                .toIso8601String()
                .substring(0, 19) +
            "Z";

        var body = {
          "title": txtAddTitle.text,
          "detail": txtAddDetail.text,
          "event_type": selectedCategory.value,
          "date": date,
          "start_time": startT,
          "end_time": endT,
          "createdBy": uId,
          "attendees": [
            uId,
            for (int i = 0; i < selectedAttendees.length; i++)
              selectedAttendees[i].id,
          ]
        };

        await ApiRequest.postRequest(baseURL + '/event/CreateEvent', body)
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
                showSnackbarSuccess("Success", "Event added.");
                loadEvents();
              }
            }
          }
        });
      } catch (e) {
      } finally {
        loadingAddEvent.value = false;
      }
    }
  }

  Future<void> loadEvents() async {
    if (!loadingEvents.value) {
      try {
        loadingEvents.value = true;

        // var body = {
        //   "username": username ?? txtEmailLogin.text,
        //   "password": password ?? txtPasswordLogin.text
        // };

        int uId = loadDataController.userModel.value.id!;
        String date = selectedDay!.value.toIso8601String().substring(0, 10);

        await ApiRequest.getRequest(
                baseURL + '/event/GetEventsByUser?date=$date&userId=$uId',
                () {})
            .then((value) async {
          if (value != null) {
            print(value);
            eventsList.value = eventsModelFromJson(value);

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
        loadingEvents.value = false;
      }
    }
  }

  getEvents() {
    eventList.add(EventModel(
        name: "Meeting with Dr. Merkel",
        description: "Scope of project, design & feesibility changes.",
        type: "meeting",
        time: "10:00 AM"));

    eventList.add(EventModel(
        name: "Server cleaning",
        description: "Cleaning server and cable management.",
        type: "task",
        time: "10:00 AM"));

    eventList.add(EventModel(
        name: "Visit to Design studio",
        description:
            "Evaluating the work done in construction of design studio.",
        type: "event",
        time: "10:00 AM"));

    eventList.add(EventModel(
        name: "Meeting with Design team",
        description: "Reevaluating the designs forwarded by client.",
        type: "meeting",
        time: "10:00 AM"));

    eventList.add(EventModel(
        name: "Completing Phase I of project",
        description:
            "Completion of phase I of project and forwarding prototypes to client",
        type: "task",
        time: "10:00 AM"));
  }

  void onMonthChange(int index) {
    selectedMonthIndex.value = index;
    selectedMonth.value = DateFormat('MMM yyyy').format(monthList[index]);
  }
}
