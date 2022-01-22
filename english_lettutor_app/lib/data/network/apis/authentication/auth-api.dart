// ignore_for_file: file_names

import 'package:english_lettutor_app/data/network/constants/endpoints.dart';
import 'package:english_lettutor_app/data/sharedpref/shared_preference_helper.dart';

import '../../rest_client.dart';

class AuthApi {
  final RestClient _restClient = RestClient.instance;
  Future<dynamic> register(String email, String password) async {
    final response = await _restClient.post(Endpoints.register, headers: {
      'Content-Type': 'application/json'
    }, body: {
      'email': email,
      'password': password,
      'source': null,
    });

    return response;
  }

  Future<dynamic> login(String email, String password) async {
    final response = await _restClient.post(Endpoints.login, headers: {
      'Content-Type': 'application/json',
    }, body: {
      'email': email,
      'password': password,
    });
    return response;
  }

  Future<dynamic> verifyAnAccount() async {
    SharedPreferenceHelper sharedPref = SharedPreferenceHelper.instance;
    String? token = await sharedPref.authToken;
    final response = await _restClient.get(
      Endpoints.verifyAccount,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'token': token ?? "",
      },
    );
    return response;
  }

  Future<dynamic> loginByGoogle(String token) async {
    final response = await _restClient.post(
      Endpoints.loginByGoogle,
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        'access_token': token,
      },
    );
    return response;
  }

  Future<dynamic> loginByFacebook(String token) async {
    final response = await _restClient.post(
      Endpoints.loginByFacebook,
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        'access_token': token,
      },
    );
    return response;
  }

  Future<dynamic> refreshToken() async {
    SharedPreferenceHelper sharedPref = SharedPreferenceHelper.instance;
    String? refreshToken = await sharedPref.refreshToken;
    final response = await _restClient.post(
      Endpoints.refreshToken,
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        'refreshToken': refreshToken ?? "",
      },
    );
    return response;
  }

  Future<dynamic> fogotPassword(String email) async {
    final response = await _restClient.post(Endpoints.forgotPassword, headers: {
      'Content-Type': 'application/json',
    }, body: {
      'email': email,
    });
    return response;
  }
}
