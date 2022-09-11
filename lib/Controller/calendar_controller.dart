import 'package:bit_planner/Model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {
  Rx<DateTime>? startDate = DateTime.now().obs;
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
  Rx<DateTime>? selectedDay = DateTime.now().obs;

  RxList<EventModel> eventList = RxList<EventModel>();

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
