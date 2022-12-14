import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:bit_planner/Helper/values.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'common_widgets/snackbar_error.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  static var client = http.Client();

  static Future<dynamic> getRequest(String url, Function func) async {
    try {
      print('checking internet');

      final result = await InternetAddress.lookup(checkInternetDomain);

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          var requestURL = Uri.parse(url);

          print(url.toString());

          SharedPreferences pref = await SharedPreferences.getInstance();
          String token = pref.getString('token') ??
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdGhhcmFrYmFyckBnbWFpbC5jbyIsImp0aSI6ImY1ODJmZDE2LTVkZTUtNGNkZC1iNDQ1LTE3MmQ0ZjlmYjJmZSIsImV4cCI6MTY5OTM3NzE4NCwiaXNzIjoibXlza29vbC5hcHAiLCJhdWQiOiJteXNrb29sLmFwcCJ9.2cq4tgRtHO9aJ2RvK1IeZXbwcJK0YFJGPdF25xzcSFk';

          var headers = {
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json; charset=utf-8'
          };

          var response;
          response = await client.get(
            requestURL,
            headers: headers,
          );

          if (response.statusCode == 200) {
            return jsonDecode(response.body);
          } else if (response.statusCode == 401) {
            return 'Unauthorized';
          } else {
            showSnackbarError('Error', 'Something went wrong');
            print(response.statusCode);
            print(response.body);
            return null;
          }
        } catch (e) {
          print('Error: $e');
          showSnackbarError('Error', 'Something went wrong');
          return null;
        }
      } else {
        print('WIFI ON NO INTERNET');
      }
    } on SocketException catch (e) {
      showSnackbarError(
        'No Internet',
        'Please check your internet connection and try again.',
      );
      return null;
    }
  }

  static Future<dynamic> uploadImages(String image) async {
    dynamic returnVal = null;
    try {
      print('checking internet');

      final result = await InternetAddress.lookup(checkInternetDomain);
      print('checked internet');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          var request = http.MultipartRequest(
              'POST', Uri.parse('https://upload.appick.io'));

          request.files.add(await http.MultipartFile.fromPath("image", image));

          var response = await request.send();
          print("res:  $response");
          print('Uploading Image');
          if (response.statusCode == 200) {
            await response.stream.bytesToString().then((value) {
              dynamic myImgs = jsonDecode(value.toString());
              if (myImgs != null) {
                returnVal = myImgs['myresp'].toList();
              } else {
                print('Error0 Caught');
              }
            });
          } else if (response.statusCode == 401) {
            return 'Unauthorized';
          } else {
            print('Error1 Caught');
            showSnackbarError('Error', 'Something went wrong');
          }
        } catch (e) {
          print('Error Caught: $e');
          showSnackbarError('Error', 'Something went wrong');
        }
      } else {
        print('WIFI ON NO INTERNET');
      }
    } on SocketException catch (e) {
      showSnackbarError('No Internet',
          'Please check your internet connection and try again.');
    }

    return returnVal;
  }

  static Future<dynamic> postRequest(
    String url,
    var body,
  ) async {
    try {
      print('checking internet');
      print(body);
      final result = await InternetAddress.lookup(checkInternetDomain);

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          var requestURL = Uri.parse(url);

          print(url.toString());

          SharedPreferences pref = await SharedPreferences.getInstance();
          String token = pref.getString('token') ??
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdGhhcmFrYmFyckBnbWFpbC5jbyIsImp0aSI6ImY1ODJmZDE2LTVkZTUtNGNkZC1iNDQ1LTE3MmQ0ZjlmYjJmZSIsImV4cCI6MTY5OTM3NzE4NCwiaXNzIjoibXlza29vbC5hcHAiLCJhdWQiOiJteXNrb29sLmFwcCJ9.2cq4tgRtHO9aJ2RvK1IeZXbwcJK0YFJGPdF25xzcSFk';
          print(token);
          if (url == 'https://api.mailjet.com/v3.1/send') {
            token = '643f082afa944352aab78c2c2102489d';
          }

          var headers = {
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json; charset=utf-8'
          };

          var response;
          response = await client.post(
            requestURL,
            headers: headers,
            body: json.encode(body),
          );
          print('Code' + response.statusCode.toString());
          if (response.statusCode == 200) {
            return jsonDecode(response.body);
          } else if (response.statusCode == 401) {
            return 'Unauthorized';
          } else {
            print(response.body);
            showSnackbarError('Error', 'Something went wrong');
            print(response.statusCode);
            return null;
          }
        } catch (e) {
          print('Error: $e');

          showSnackbarError('Error', 'Something went wrong');
          return null;
        }
      } else {
        print('WIFI ON NO INTERNET');
      }
    } on SocketException catch (e) {
      showSnackbarError(
        'No Internet',
        'Please check your internet connection and try again.',
      );

      return null;
    }
  }

  static Future<dynamic> postOTPRequest(
    String url,
  ) async {
    try {
      print('checking internet');
      //print(body);
      final result = await InternetAddress.lookup(checkInternetDomain);
      print('checked internet');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          var requestURL = Uri.parse(url);

          print(url.toString());

          SharedPreferences pref = await SharedPreferences.getInstance();
          String token = pref.getString('token') ??
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdGhhcmFrYmFyckBnbWFpbC5jbyIsImp0aSI6ImY1ODJmZDE2LTVkZTUtNGNkZC1iNDQ1LTE3MmQ0ZjlmYjJmZSIsImV4cCI6MTY5OTM3NzE4NCwiaXNzIjoibXlza29vbC5hcHAiLCJhdWQiOiJteXNrb29sLmFwcCJ9.2cq4tgRtHO9aJ2RvK1IeZXbwcJK0YFJGPdF25xzcSFk';

          // var headers = {
          //   'Authorization': 'Bearer ' + token,
          //   'Content-Type': 'application/json; charset=utf-8'
          // };

          var response;
          response = await client.post(
            requestURL,
            // headers: headers,
            // body: json.encode(body),
          );
          // print(body);
          if (response.statusCode == 200) {
            if (jsonDecode(response.body)['status'] == 'success') {
              return jsonDecode(response.body);
            } else if (jsonDecode(response.body)['status'] == 'userSuccess') {
              return jsonDecode(response.body);
            } else {
              return jsonDecode(response.body);
            }
          } else if (response.statusCode == 401) {
            return 'Unauthorized';
          } else {
            showSnackbarError('Error', 'Something went wrong');
            print(response.statusCode);
            return null;
          }
        } catch (e) {
          print('Error: $e');

          showSnackbarError('Error', 'Something went wrong');
          return null;
        }
      } else {
        print('WIFI ON NO INTERNET');
      }
    } on SocketException catch (e) {
      showSnackbarError(
        'No Internet',
        'Please check your internet connection and try again.',
      );

      return null;
    }
  }

  static Future<dynamic> putRequest(
    String url,
    var body,
  ) async {
    try {
      print('checking internet');

      final result = await InternetAddress.lookup(checkInternetDomain);
      print('checked internet');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          var requestURL = Uri.parse(url);

          print(url.toString());

          SharedPreferences pref = await SharedPreferences.getInstance();
          String token = pref.getString('token') ??
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdGhhcmFrYmFyckBnbWFpbC5jbyIsImp0aSI6ImY1ODJmZDE2LTVkZTUtNGNkZC1iNDQ1LTE3MmQ0ZjlmYjJmZSIsImV4cCI6MTY5OTM3NzE4NCwiaXNzIjoibXlza29vbC5hcHAiLCJhdWQiOiJteXNrb29sLmFwcCJ9.2cq4tgRtHO9aJ2RvK1IeZXbwcJK0YFJGPdF25xzcSFk';

          var headers = {
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json; charset=utf-8'
          };

          var response;
          response = await client.put(
            requestURL,
            headers: headers,
            body: json.encode(body),
          );
          print(body);
          if (response.statusCode == 200) {
            return jsonDecode(response.body);
          } else if (response.statusCode == 401) {
            return 'Unauthorized';
          } else {
            print('Error: ${response.statusCode}');
            showSnackbarError('Error', 'Something went wrong');

            return null;
          }
        } catch (e) {
          print('Error: $e');

          showSnackbarError('Error', 'Something went wrong');
          return null;
        }
      } else {
        print('WIFI ON NO INTERNET');
        return null;
      }
    } on SocketException catch (e) {
      showSnackbarError(
        'No Internet',
        'Please check your internet connection and try again.',
      );

      return null;
    }
  }

  static Future<dynamic> deleteRequest(
    String url,
  ) async {
    try {
      print('checking internet');

      final result = await InternetAddress.lookup(checkInternetDomain);
      print('checked internet');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          var requestURL = Uri.parse(url);

          print(url.toString());

          SharedPreferences pref = await SharedPreferences.getInstance();
          String token = pref.getString('token') ??
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdGhhcmFrYmFyckBnbWFpbC5jbyIsImp0aSI6ImY1ODJmZDE2LTVkZTUtNGNkZC1iNDQ1LTE3MmQ0ZjlmYjJmZSIsImV4cCI6MTY5OTM3NzE4NCwiaXNzIjoibXlza29vbC5hcHAiLCJhdWQiOiJteXNrb29sLmFwcCJ9.2cq4tgRtHO9aJ2RvK1IeZXbwcJK0YFJGPdF25xzcSFk';

          var headers = {
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json; charset=utf-8'
          };

          var response;
          response = await client.delete(
            requestURL,
            headers: headers,
          );
          if (response.statusCode == 200) {
            return jsonDecode(response.body);
          } else if (response.statusCode == 401) {
            return 'Unauthorized';
          } else {
            showSnackbarError('Error', 'Something went wrong');

            return null;
          }
        } catch (e) {
          print('Error: $e');

          showSnackbarError('Error', 'Something went wrong');
          return null;
        }
      } else {
        print('WIFI ON NO INTERNET');
        return null;
      }
    } on SocketException catch (e) {
      showSnackbarError(
        'No Internet',
        'Please check your internet connection and try again.',
      );
      return null;
    }
  }
}

String timeDifference(DateTime dt) {
  var seconds = ((DateTime.now().difference(dt).inSeconds)).floor();

  var interval = seconds / 31536000;

  if (interval > 1) {
    return interval.floor().toString() + " yr".tr;
  }

  interval = seconds / 2592000;
  if (interval > 1) {
    return interval.floor().toString() + " mn".tr;
  }
  interval = seconds / 86400;
  if (interval > 1) {
    return interval.floor().toString() + " days".tr;
  }
  interval = seconds / 3600;
  if (interval > 1) {
    return interval.floor().toString() + " hrs".tr;
  }
  interval = seconds / 60;
  if (interval > 1) {
    return interval.floor().toString() + " m".tr;
  }

  return "Just now";
}

bool isEmail(String string) {
  if (string == null || string.isEmpty) {
    return false;
  }

  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return false;
  }
  return true;
}

bool isPhone(String string) {
  if (string == null || string.isEmpty) {
    return false;
  }

  const pattern = r'[0][3][0-9]{9}';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return false;
  }
  return true;
}
