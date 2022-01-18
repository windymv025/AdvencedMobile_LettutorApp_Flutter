import 'package:english_lettutor_app/data/network/constants/endpoints.dart';

import '../../rest_client.dart';

class TutorApi {
  final RestClient _restClient = RestClient.instance;
  Future<dynamic> getListTutorWithPagination(int page,
      [int perPage = 12]) async {
    final response =
        await _restClient.get(Endpoints.getListTutorPagin, headers: {
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
    final response = await _restClient.get(Endpoints.getTutorInformationById,
        headers: {'Authorization': 'Bearer ${await _restClient.getToken()}'},
        params: {'tutorId': tutorId});

    return response;
  }

  Future<dynamic> searchTutor(String studentRequest) async {
    final response = await _restClient.post(Endpoints.searchTutor,
        headers: {'Authorization': 'Bearer ${await _restClient.getToken()}'},
        body: {'studentRequest': studentRequest});

    return response;
  }

  Future<dynamic> addATutorToFavouriteList(String tutorId) async {
    final response = await _restClient.post(Endpoints.addATutorFavourite,
        headers: {'Authorization': 'Bearer ${await _restClient.getToken()}'},
        body: {'tutorId': tutorId});

    return response;
  }
}
