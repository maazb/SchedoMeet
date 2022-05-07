import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class NavigationController extends GetxController {
  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);
}
