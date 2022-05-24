import 'package:bit_planner/Model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/chat_model.dart';

class MessagesController extends GetxController {
  RxList<EventModel> eventList = RxList<EventModel>();
  RxList<ChatModel> chatList = RxList<ChatModel>();
  TextEditingController txtSearch = TextEditingController();
  RxList<int> selectedContacts = RxList<int>();

  RxList<ChatModel> searchList = RxList();

  Future<void> onSearch(String query) async {
    if (query == "") {
      searchList.value = chatList.where((p0) => true).toList();
    } else {
      searchList.value = chatList
          .where(
              (p0) => p0.message!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  // Future<void> getChatDates() async {
  //   chatDateList.clear();

  //   for (var i = 0; i < searchList.length; i++) {
  //     DateTime temp = DateTime(searchList[i].date!.year,
  //         searchList[i].date!.month, searchList[i].date!.day);
  //     if (!chatDateList.contains(temp)) {
  //       chatDateList.add(temp);
  //     }
  //   }
  //   print(chatDateList);
  // }

  Future<void> getChat() async {
    chatList.add(ChatModel(
        date: DateTime.now().subtract(Duration(days: 3)),
        id: 1,
        message:
            "Hello, how are you? we would like to know your thoughts on our new product.",
        sender: false,
        senderName: "Imran"));
    chatList.add(ChatModel(
        date: DateTime.now().subtract(Duration(days: 3)),
        id: 2,
        message: "I am fine your products are great, I've checked your website",
        sender: true,
        senderName: "Zahir"));
    chatList.add(ChatModel(
        date: DateTime.now().subtract(Duration(days: 3)),
        id: 3,
        message: "And I do believe you had sets of classroom chairs",
        sender: true,
        senderName: "Abdullah"));
    chatList.add(ChatModel(
        date: DateTime.now().subtract(Duration(days: 2)),
        id: 4,
        message: "Yes we do have those in various designs and formfactors",
        sender: false,
        senderName: "Azfar"));
    chatList.add(ChatModel(
        date: DateTime.now().subtract(Duration(days: 2)),
        id: 5,
        message:
            "We will be glad to show you our catalog, we do have catalog at our website",
        sender: false,
        senderName: "Kashif"));
    chatList.add(ChatModel(
        date: DateTime.now().subtract(Duration(days: 1)),
        id: 6,
        message:
            "Or if you want we can show you the current school projects we are working on",
        sender: false,
        senderName: "Ghulam"));
    chatList.add(ChatModel(
        date: DateTime.now().subtract(Duration(days: 1)),
        id: 6,
        message:
            "That will be fantastic, I'll be very keen to look at latest school furniture designs",
        sender: true,
        senderName: "Ahmed"));
    chatList.add(ChatModel(
        date: DateTime.now().subtract(Duration(days: 1)),
        id: 6,
        message:
            "Sure, we will deploy the projects tommorrow, I'll capture the pics once they are out for shipment",
        sender: false,
        senderName: "Ali"));
    chatList.add(ChatModel(
        date: DateTime.now(),
        haveImage: true,
        images: [
          "https://www.gannett-cdn.com/presto/2020/08/17/PIND/324f8dd6-fbb0-42bc-a2dd-ab3c182b2e41-IPS_back_to_school_virtually_GH01.JPG",
          "https://media.euobserver.com/df8317ee95aaac1d47ea2f9514e3262e.jpg",
          "https://www.arabianbusiness.com/cloud/2021/11/13/60U2Dm5e-Schools.jpg"
        ],
        id: 6,
        message:
            "These are the three latest school furniture projects we worked on",
        sender: false,
        senderName: "Khan"));
    chatList.add(ChatModel(
        date: DateTime.now(),
        id: 6,
        message:
            "Great, let me consult my superiors, and I will get back to you",
        sender: true,
        senderName: "Iftikhar"));
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

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
