import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:interview_task/models/user_comments_model.dart';
import 'package:interview_task/utils/api_urls.dart';
import 'package:http/http.dart' as http;

class ApiServicesProvider extends ChangeNotifier {
  Future<List<UserComments>> fetchUserComments() async {
    try {
      var url = ApiUrls.apiUrl;
      List<UserComments> userComments = [];
      http.Response response = await http.get(Uri.parse(url));
      log("Api Response: ${response.body}");
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        userComments = jsonData.map((data) => UserComments.fromJson(data)).toList();
      } else {
        log("Error: ${response.reasonPhrase}");
      }
      return userComments;
    } catch (error) {
      log("Error: ${error.toString()}");
      return [];
    }
  }
}
