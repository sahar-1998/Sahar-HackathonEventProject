import 'dart:convert';

import 'package:evemts/api/api_helper.dart';
import 'package:evemts/api/api_setting.dart';
import 'package:evemts/models/base_api_object_response.dart';
import 'package:evemts/models/category.dart';
import 'package:evemts/models/event.dart';
import 'package:evemts/models/event.dart';
import 'package:evemts/prefs/shared_pref_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class EventApiController with ApiHelper {

  Future<List<Category>> getCategories() async {
    var url = Uri.parse(ApiSetting.categories);
    var response = await http.get(url, headers: headers);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['list'] as List;
      List<Category > categories = data.map((e) => Category .fromJson(e)).toList();
      return categories;
    }
    return [];
  }

  Future<List<Event>> showEvent() async {
    var url = Uri.parse(ApiSetting.showEvent);
    var response = await http.get(url,
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode==200) {
      var data = jsonDecode(response.body)['list'] as List;
      List<Event > event = data.map((e) => Event .fromJson(e)).toList();
      return event;
    }
    return [];
  }

  Future<bool> createEvent(BuildContext context, {
      required String name,
      required String info,
      required String date,
      required String time,
      required String address,
      required int durationHours,
      required String image,
      required int categoryId,
      required int userId,
      required String createdAt,
      required int commentsCount,
      required int imagesCount,
      required String imageUrl,
      required String status,}) async {
    var url = Uri.parse(ApiSetting.creatEvent);
    var response = await http.post(url, body: {
      'name': name,
      'info': info,
      'date': date,
      'time': time,
      'address': address,
      'durationHours': durationHours,
      'image': image,
      'createdAt': createdAt,
      'commentsCount': commentsCount,
      'imagesCount': imagesCount,
      'imageUrl': imageUrl,
      'status': status,
  },headers: headers
    );
    if (response.statusCode == 200) {
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
      var baseApiResponse = BaseApiObjectResponse<Event>.fromJson(jsonDecode(response.body));
      print(jsonDecode(response.body)['code']);

      showSnackBar(
        context,
        message: baseApiResponse.message,
      );

      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }else{
      showSnackBar(context, message: 'Something went wrong, please try again!',error: true);
    }
    return false;
  }


  Future<bool> updateEvent(BuildContext context, {
    required String name,
    required String info,
    required String date,
    required String time,
    required String address,
    required int durationHours,
    required String image,
    required String createdAt,
    required int commentsCount,
    required int imagesCount,
    required String imageUrl,
    required String status,}) async {
    var url = Uri.parse(ApiSetting.updateEvent);
    var response = await http.post(url, body: {
      'name': name,
      'info': info,
      'date': date,
      'time': time,
      'address': address,
      'durationHours': durationHours,
      'image': image,
      'createdAt': createdAt,
      'commentsCount': commentsCount,
      'imagesCount': imagesCount,
      'imageUrl': imageUrl,
      'status': status,
    },headers: headers
    );
    if (response.statusCode == 200) {
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
      var baseApiResponse = BaseApiObjectResponse<Event>.fromJson(jsonDecode(response.body));
      print(jsonDecode(response.body)['code']);

      showSnackBar(
        context,
        message: baseApiResponse.message,
      );

      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }else{
      showSnackBar(context, message: 'Something went wrong, please try again!',error: true);
    }
    return false;
  }


  Future<bool> deleteEvent(BuildContext context) async {
    var url = Uri.parse(ApiSetting.deleteEvent);
    var response = await http.delete(url,
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      await SharedPrefController().delete();
      return true;
    }
    return false;
  }



}
