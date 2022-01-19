import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/network/constants/endpoints.dart';

import '../../rest_client.dart';

class TutorApi {
  final RestClient _restClient = RestClient.instance;
  Future<dynamic> getListTutorWithPagination(int page,
      [int perPage = 12]) async {
    final response =
        await _restClient.get(Endpoints.getListTutorPagin, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, params: {
      'perPage': perPage.toString(),
      'page': page.toString(),
    });

    return response;
  }

  Future<dynamic> writeReviewAtutor(
      String bookingID, String userID, double rating, String content) async {
    final response =
        await _restClient.post(Endpoints.writeReviewATutor, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, body: {
      'bookingId': bookingID,
      'userId': userID,
      'rating': rating.toString(),
      'content': content,
    });

    return response;
  }

  Future<dynamic> getTutorInformationById(String tutorId) async {
    final response =
        await _restClient.get(Endpoints.getTutorInformationById, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, params: {
      'tutorId': tutorId
    });

    return response;
  }

  Future<dynamic> searchTutor(
    String keySearch, {
    int page = 1,
    int perPage = 12,
    List<String>? specialties,
  }) async {
    final response = await _restClient.post(Endpoints.searchTutor, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, body: {
      "page": page,
      "perPage": perPage,
      "filters": {
        "specialties": specialties ?? kMapSpecialities.keys.toList().sublist(1),
      },
      "search": keySearch
    });

    return response;
  }

  Future<dynamic> addATutorToFavouriteList(String tutorId) async {
    final response =
        await _restClient.post(Endpoints.addATutorFavourite, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, body: {
      'tutorId': tutorId
    });

    return response;
  }
}
