import 'dart:convert';
import 'dart:io';

import 'package:english_lettutor_app/data/network/constants/endpoints.dart';
import 'package:english_lettutor_app/models/profile/profile.dart';
import 'package:intl/intl.dart';

import '../../rest_client.dart';

class UserApi {
  final RestClient _restClient = RestClient.instance;
  Future<dynamic> changePassword(String password, String newPassword) async {
    final response = await _restClient.post(Endpoints.changePassword, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, body: {
      "password": password,
      "newPassword": newPassword
    });

    return response;
  }

  Future<dynamic> getUserInformation() async {
    final response = await _restClient.get(Endpoints.userInfo,
        headers: {'Authorization': 'Bearer ${await _restClient.getToken()}'});

    return response;
  }

  Future<dynamic> updateUserInformation(Profile user) async {
    var birthDay = DateFormat('yyyy-MM-dd').format(user.birthday!);
    var learnTopic = user.learnTopics?.map((e) => e.id).toList();
    var testPreparations = user.testPreparations?.map((e) => e.id).toList();
    final response = await _restClient.put(Endpoints.userInfo, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, body: {
      "name": user.name,
      "country": user.country,
      "phone": user.phone,
      "birthday": birthDay,
      "level": user.level,
      "learnTopics": learnTopic,
      "testPreparations": testPreparations,
    });

    return response;
  }

  Future<dynamic> updateAvatar(File image) async {
    final response = await _restClient.post(Endpoints.userAvatar, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, body: {
      "avatar": base64Encode(image.readAsBytesSync())
    });

    return response;
  }
}
