class Teacher {
  int id;
  String? uriImage;
  String name;
  String description;
  List<String>? languages;
  String? education;
  String? experience;
  List<String>? interests;
  String? profession;
  List<String> specialties;
  double ratings;

  Teacher(
      {required this.id,
      required this.name,
      required this.specialties,
      this.uriImage,
      required this.description,
      this.education,
      this.experience,
      this.interests,
      this.languages,
      this.profession,
      this.ratings = 0});
}
