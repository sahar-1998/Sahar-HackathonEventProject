import 'dart:convert';
import 'dart:io';
import 'package:evemts/api/api_helper.dart';
import 'package:evemts/api/api_setting.dart';
import 'package:evemts/models/base_api_object_response.dart';
import 'package:evemts/models/user.dart';
import 'package:evemts/prefs/shared_pref_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class AuthApiController with ApiHelper {

  Future<bool> login(BuildContext context,
      {required String mobile, required String password}) async {
    var url = Uri.parse(ApiSetting.login);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'password': password,
    }, headers: headers);
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body)['data'];
      User user = User.fromJson(jsonObject);
      await SharedPrefController().save(user: user);
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }}


  Future<bool> logout() async {
    var url = Uri.parse(ApiSetting.logout);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return true;
    }
    return false;
  }
  

