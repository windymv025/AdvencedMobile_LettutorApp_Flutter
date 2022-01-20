import 'package:english_lettutor_app/data/network/constants/endpoints.dart';

import '../../rest_client.dart';

class CourseApi {
  final RestClient _restClient = RestClient.instance;
  Future<dynamic> getListCourseWithPaginaion(int page,
      [int perPage = 1000]) async {
    final response = await _restClient.get(Endpoints.getListCoursePagin,
        headers: {'Authorization': 'Bearer ${await _restClient.getToken()}'},
        params: {'page': page.toString(), 'size': perPage.toString()});

    return response;
  }

  Future<dynamic> getCourseDetailByID(int courseId) async {
    final response = await _restClient.get(
        "${Endpoints.getCourseDetailByCourseId}/$courseId",
        headers: {'Authorization': 'Bearer ${await _restClient.getToken()}'});

    return response;
  }

  Future<dynamic> searchCourse(String keySearch, String categoryId,
      [int page = 1, int perPage = 1000]) async {
    final response = await _restClient.get(Endpoints.searchCourse, headers: {
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, params: {
      'page': page.toString(),
      'size': perPage.toString(),
      'categoryId[]': categoryId,
      'q': keySearch,
    });

    return response;
  }

  Future<dynamic> searchCourseAllCategory(String keySearch,
      [int page = 1, int perPage = 1000]) async {
    final response = await _restClient.get(Endpoints.searchCourse, headers: {
      'Authorization': 'Bearer ${await _restClient.getToken()}'
    }, params: {
      'page': page.toString(),
      'size': perPage.toString(),
      'q': keySearch,
    });

    return response;
  }

  Future<dynamic> getContentCategory() async {
    final response = await _restClient.get(Endpoints.contentCategory,
        headers: {'Authorization': 'Bearer ${await _restClient.getToken()}'});

    return response;
  }
}
