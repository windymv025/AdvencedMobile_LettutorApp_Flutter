import 'package:english_lettutor_app/models/course/course-models.dart';

class CategoryModel {
  CategoryModel({
    this.count,
    this.rows,
  });

  int? count;
  List<Category>? rows;

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        count: json["count"],
        rows: json["rows"] == null
            ? null
            : List<Category>.from(json["rows"].map((x) => Category.fromMap(x))),
      );
}
