
import 'dart:convert';
import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_dialog/loading_dialog.dart';


import 'package:shared_preferences/shared_preferences.dart';

final coloryellow = Color.fromRGBO(255, 207, 27, 1);
final colorOrange = Color.fromRGBO(255, 136, 27, 1);
final colorGrey = Color.fromRGBO(57, 57, 57, 1);
final colorYellow = Color.fromRGBO(244, 152, 49, 1);
final colorPrimary = Color.fromRGBO(0, 22, 97, 1);

final lightGrey = Color.fromRGBO(107, 113, 132, 1);
final purple = Color.fromRGBO(154, 58, 119, 1);
final pink = Color.fromRGBO(191, 47, 80, 1);

final Shader linearGradient = LinearGradient(
  colors: <Color>[colorYellow, colorOrange],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

const String ID = "id";
const String FIRSTNAME = "firstName";
const String UID = "userid";
const String LID = "lid";
const String ROLE = "role";
const String MIN_FILL_COUNT = "minFillCount";
const String LASTNAME = "lastName";
const String CONTACT = "contact";
const String NICE_NAME = "nice_name";
const String DOB = "dob";
const String SEX = "sex";
const String DESCRIPTION = "description";
const String ACTIVE = "active";
const String EMAIL = "email";
const String ACCEPTS_MARKETING = "accepts_marketing";
const String LOGGED_IN = "isLoggedIn";
const String MEMBER_SINCE = "member_since";
const String AVATAR = "avatar";
const String API_TOKEN = "api_token";
const String CONTACT_NUMBER = "contact_number";

const String PROJECTS_COUNT = "project_count";

const String BASE_URL = "https://api.covid19india.org";
String authKey;

LoadingDialog loadingDialog;



dismissDialog() {
  if (loadingDialog != null && loadingDialog.isShowing()) {
    loadingDialog.hide();
  }
}

void loading(BuildContext context, String msg) {
  loadingDialog = LoadingDialog(
    buildContext: context,
    loadingView: null,
    //yourself loading view ,default is CircularProgressIndicator
    radius: 15,
    //dialog bg radius
    elevation: 0,
    //dialog elevation
    size: 40,
    // loading view size
    padding: 10,
    //text to loading view
    width: 150,
    //dialog width
    height: 150,
    //dialog height
    loadingMessage: msg,
    //your message
    textColor: Colors.white,
    //message text color
    textSize: 14,
    //message text size
    style: LoadingDialogStyle.vertical,
    // or vertical
    backgroundColor: Colors.black26,
    //dialog background color
    barrierColor: Colors.black54,
    //window color
    barrierDismissible: true, //touch window dismiss
  );
  loadingDialog.show();
}

Future<bool> isInternet(var connectivityResult) async {
  bool net = false;
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    net = true;
  }
  return net;
}

void noInternet() {
  Get.snackbar("Error", "No Internet Connection",
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP);
}


void redSnack(String msg) {
  Get.snackbar("Error", msg,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP);
}


void greenSnack(String msg) {
  Get.snackbar("Success", msg,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP);
}



Map<String, String> headers = {'Accept': 'application/json'};



Map<String, String> headersAandC = {
  'Accept': 'application/json',
  'Content-Type': 'application/json',
};

Map<String, String> headersFile = {
  'Accept': 'application/json',
  'Content-Type': 'multipart/form-data',
  'Authorization': 'Bearer $authKey'
};

