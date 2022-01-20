import 'package:english_lettutor_app/data/network/constants/endpoints.dart';

import '../../rest_client.dart';

class ScheduleApi {
  final RestClient _restClient = RestClient.instance;
  Future<dynamic> getOwnSchedule() async {
    final response = await _restClient.post(Endpoints.schedule, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    });

    return response;
  }

  Future<dynamic> getScheduleByTutorID(String tutorID) async {
    final response = await _restClient.post(Endpoints.scheduleByID, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, body: {
      'tutorId': tutorID
    });

    return response;
  }

  Future<dynamic> getBookedClasses(int page, int dateTimeLte,
      [int perPage = 1000,
      String orderBy = 'meeting',
      String sortBy = 'desc']) async {
    final response =
        await _restClient.get(Endpoints.getBookedClasses, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, params: {
      'page': page.toString(),
      'perPage': perPage.toString(),
      'dateTimeLte': dateTimeLte.toString(),
      'orderBy': orderBy,
      'sortBy': sortBy
    });

    return response;
  }

  Future<dynamic> getBookedClassesFull(int page,
      [int perPage = 1000,
      String orderBy = 'meeting',
      String sortBy = 'desc']) async {
    final response =
        await _restClient.get(Endpoints.getBookedClasses, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, params: {
      'page': page.toString(),
      'perPage': perPage.toString(),
      'orderBy': orderBy,
      'sortBy': sortBy
    });

    return response;
  }

  Future<dynamic> bookAClass(List<String> scheduleDetailIds,
      [String note = ""]) async {
    final response = await _restClient.post(Endpoints.bookAClass, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, body: {
      'scheduleDetailIds': scheduleDetailIds,
      'note': note
    });

    return response;
  }

  Future<dynamic> cancelAbookedClass(
    List<String> scheduleDetailIds,
  ) async {
    final response =
        await _restClient.delete(Endpoints.cancelBookAClass, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, body: {
      'scheduleDetailIds': scheduleDetailIds,
    });

    return response;
  }

  Future<dynamic> updateStudentRequest(
    String bookedId,
    String studentRequest,
  ) async {
    final response =
        await _restClient.post(Endpoints.updateStudentRequest, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, body: {
      'studentRequest': studentRequest,
    }, params: {
      'bookedId': bookedId
    });

    return response;
  }
}
