import 'package:bit_planner/Model/setting_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AccountController extends GetxController {
  RxList<SettingModel> settingsList = RxList<SettingModel>();

  getEvents() {
    settingsList.add(SettingModel(
        name: "Calendar settings", icon: "assets/icons/Calendar.svg"));
    settingsList.add(
        SettingModel(name: "Messages settings", icon: "assets/icons/Chat.svg"));

    settingsList.add(SettingModel(
        name: "Scheduling settings", icon: "assets/icons/Alarm.svg"));

    settingsList.add(
        SettingModel(name: "Privacy policy", icon: "assets/icons/Shield.svg"));

    settingsList.add(
        SettingModel(name: "About us", icon: "assets/icons/Info-circle.svg"));

    settingsList
        .add(SettingModel(name: "Sign out", icon: "assets/icons/Logout.svg"));
  }
}
