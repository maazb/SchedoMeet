import 'package:bit_planner/Controller/load_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Values

String checkInternetDomain = 'example.com';
String baseURL = 'https://schedomeet.herokuapp.com';
String tokenKey = '2ZWFmMjYiLCJleHAiOjE2MjI';
String mapKey = 'AIzaSyD7jpVB_jaW4RJw21fuW19MqnvrPGIyB6M';
const String oneSignalKey = 'ce39468c-285d-4478-b3e9-1e5cc1451dbd';

RxString picPlaceHolder =
    'https://firebasestorage.googleapis.com/v0/b/schedomeet.appspot.com/o/images%2FprofilePlaceholder.jpg?alt=media&token=8b936f03-1e54-4227-b2c6-1473dd632ff0'
        .obs;

String googleMapsKey = 'AIzaSyD7jpVB_jaW4RJw21fuW19MqnvrPGIyB6M';

LoadDataController loadDataController = LoadDataController.instance;

DateTime getDate(DateTime dt) {
  return DateTime(dt.year, dt.month, dt.day, 0, 0, 0, 0, 0);
}

//Colors:

Color primaryBlue = Color.fromRGBO(8, 15, 126, 1);
Color white = const Color.fromRGBO(255, 255, 255, 1);
Color red = const Color.fromRGBO(191, 36, 69, 1);
Color textColor = const Color.fromRGBO(3, 6, 48, 1);
Color primaryMedium = const Color.fromRGBO(70, 76, 163, 1);
Color primaryLight = const Color.fromRGBO(236, 237, 254, 1);
Color brown = const Color.fromRGBO(57, 36, 19, 1);
Color yellowLight = const Color.fromRGBO(254, 243, 226, 1);
Color greyLight = const Color.fromRGBO(247, 247, 247, 1);
Color grey = const Color.fromRGBO(134, 134, 155, 1);
Color greyMedium = const Color.fromRGBO(245, 245, 245, 1);
