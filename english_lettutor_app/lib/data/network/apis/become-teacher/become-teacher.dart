// ignore: file_names
import 'package:english_lettutor_app/data/network/constants/endpoints.dart';

import '../../rest_client.dart';

class BecomeTeacher {
  final RestClient _restClient = RestClient.instance;
  Future<dynamic> becomeATeacher(
      {required String name,
      required String country,
      required DateTime birthday,
      required String? interests,
      required String? education,
      required String? experience,
      required String profession,
      required List<String> languages,
      required String bio,
      required targetStudent,
      required List<String> specialties,
      required avatar,
      required video,
      required String? price}) async {
    final response = await _restClient.put(Endpoints.becomeATeacher, headers: {
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, body: {
      'name': name,
      'country': country,
      'birthday': birthday,
      'interests': interests,
      'education': education,
      'experience': experience,
      'profession': profession,
      'languages': languages,
      'bio': bio,
      'targetStudent': targetStudent,
      'specialties': specialties,
      'avatar': avatar,
      'video': video,
      'price': price ?? '50000'
    });

    return response;
  }
}
