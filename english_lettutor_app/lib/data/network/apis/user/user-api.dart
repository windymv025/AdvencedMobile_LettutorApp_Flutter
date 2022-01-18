import 'package:english_lettutor_app/data/network/constants/endpoints.dart';
import 'package:english_lettutor_app/models/profile/profile.dart';

import '../../rest_client.dart';

class UserApi {
  final RestClient _restClient = RestClient.instance;
  Future<dynamic> changePassword(String password, String newPassword) async {
    final response = await _restClient.post(Endpoints.changePassword,
        headers: {'Authorization': 'Bearer ${await _restClient.getToken()}'},
        body: {"password": password, "newPassword": newPassword});

    return response;
  }

  Future<dynamic> getUserInformation() async {
    final response = await _restClient.get(Endpoints.userInfo,
        headers: {'Authorization': 'Bearer ${await _restClient.getToken()}'});

    return response;
  }

  Future<dynamic> updateUserInformation(Profile user) async {
    final response = await _restClient.post(Endpoints.changePassword, headers: {
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, body: {
      "name": user.name,
      "country": user.country,
      "phone": user.phone,
      "birthday": user.birthday,
      "level": user.level,
      "learnTopics": user.learnTopics ?? [],
      "testPreparations": user.testPreparations ?? [],
    });

    return response;
  }
}
