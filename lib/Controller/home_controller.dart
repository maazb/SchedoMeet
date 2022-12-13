import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/Helper/services.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/Model/event_model.dart';
import 'package:bit_planner/Model/events_model.dart';
import 'package:bit_planner/View/Startup/welcome.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<EventModel> eventList = RxList<EventModel>();

  RxList<EventsModel> eventsList = RxList<EventsModel>();
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
}
