import 'package:english_lettutor_app/data/network/constants/endpoints.dart';

import '../../rest_client.dart';

class CourseApi {
  final RestClient _restClient = RestClient.instance;
  Future<dynamic> getListCourseWithPaginaion(int page,
      [int perPage = 12]) async {
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
}
