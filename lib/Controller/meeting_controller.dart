import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MeetingController extends GetxController {
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
  void onMonthChange(int index) {
    selectedMonthIndex.value = index;
    selectedMonth.value = DateFormat('MMM yyyy').format(monthList[index]);
  }
}
