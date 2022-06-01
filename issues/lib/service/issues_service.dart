import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:github_issues/model/issues_model.dart';
import 'package:http/http.dart' as http;

class CompanyUsersService {


  Future<List<UserIssuesModel>> getUserService(BuildContext context) async {
    http.Client client = http.Client();
    try {
      var response = await client.get(Uri.parse("https://api.github.com/repos/Alamofire/Alamofire/issues"));
      if (response.statusCode == 200) {
        var parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
        return parsed.map<UserIssuesModel>((json) => UserIssuesModel.fromJson(json)).toList();
      } else {
        const Text("Bir hata oluştu. Daha sonra tekrar deneyin");

        List<UserIssuesModel> parsed = [];
        return parsed;
      }
    } catch (e) {
      if (e is SocketException) {
        const Text("İnternet bağlantısı yok");
      } else if (e is TimeoutException) {
        const Text("Bağlantı zaman aşımına uğradı. Tekrar deneyin");
      } else {
        Text("Bir hata ile karşılaştık : " + e.toString());
      }
      List<UserIssuesModel> parsed = [];
      return parsed;
    } finally {
      client.close();
    }
  }
}
