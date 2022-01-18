class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "sandbox.api.lettutor.com";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // authentication endpoints
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String verifyAccount = "/auth/verifyAccount";
  static const String loginByGoogle = "/auth/google";
  static const String loginByFacebook = "/auth/facebook";
  static const String refreshToken = "/auth/refresh-token";
  static const String forgotPassword = "/user/forgotPassword";

  // user endpoints
  static const String changePassword = "/auth/change-password";
  static const String userInfo = "/user/info";

  // Become Teacher
  static const String becomeATeacher = "/tutor/register";

  // Schedule
  static const String schedule = "/schedule/list";
  static const String getBookedClasses = "/booking/list/student";
  static const String bookAClass = "/booking";
  static const String cancelBookAClass = "/booking";
  static const String updateStudentRequest = "/booking/student-request";

  // Tutor
  static const String getListTutorPagin = "/tutor/more";
  static const String writeReviewATutor = "/user/feedbackTutor";
  static const String getTutorInformationById = "/tutor";
  static const String searchTutor = "/tutor/search";
  static const String addATutorFavourite = "/user/manageFavoriteTutor";

  // Course and Ebook
  static const String getListCoursePagin = "/course";
  static const String getCourseDetailByCourseId = "/course";
}
