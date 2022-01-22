import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/models/course/course.dart';

class CourseModel {
  CourseModel({
    this.count,
    this.rows,
  });

  int? count;
  List<ItemCourse>? rows;

  factory CourseModel.fromMap(Map<String, dynamic> json) => CourseModel(
        count: json["count"],
        rows: json["rows"] == null
            ? null
            : List<ItemCourse>.from(
                json["rows"].map((x) => ItemCourse.fromMap(x))),
      );

  List<Course> get courses {
    return rows!.map((e) => e.getCourse()).toList();
  }

  Map<String, dynamic> toMap() => {
        "count": count,
        "rows": rows == null
            ? null
            : List<dynamic>.from(rows!.map((x) => x.toMap())),
      };
}

class ItemCourse {
  ItemCourse({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.reason,
    this.purpose,
    this.otherDetails,
    this.defaultPrice,
    this.coursePrice,
    this.courseType,
    this.sectionType,
    this.visible,
    this.createdAt,
    this.updatedAt,
    this.topics,
    this.categories,
  });

  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? level;
  String? reason;
  String? purpose;
  String? otherDetails;
  int? defaultPrice;
  int? coursePrice;
  dynamic courseType;
  dynamic sectionType;
  bool? visible;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Topic>? topics;
  List<Category>? categories;

  Course getCourse() {
    return Course(
      id: id,
      name: name,
      subtitle: description,
      image: imageUrl,
      level: level,
      whyTakeCourse: reason,
      whatBeAbleToDo: purpose,
      topics: topics,
      lessons: topics!.length,
    );
  }

  factory ItemCourse.fromMap(Map<String, dynamic> json) => ItemCourse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        level: kLevels[int.parse(json["level"])],
        reason: json["reason"],
        purpose: json["purpose"],
        otherDetails: json["other_details"],
        defaultPrice: json["default_price"],
        coursePrice: json["course_price"],
        courseType: json["courseType"],
        sectionType: json["sectionType"],
        visible: json["visible"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        topics: json["topics"] == null
            ? null
            : List<Topic>.from(json["topics"].map((x) => Topic.fromMap(x))),
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "level": level,
        "reason": reason,
        "purpose": purpose,
        "other_details": otherDetails,
        "default_price": defaultPrice,
        "course_price": coursePrice,
        "courseType": courseType,
        "sectionType": sectionType,
        "visible": visible,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "topics": topics == null
            ? null
            : List<dynamic>.from(topics!.map((x) => x.toMap())),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toMap())),
      };
}

class Category {
  Category({
    this.id,
    this.title,
    this.description,
    this.key,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? title;
  dynamic description;
  String? key;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        key: json["key"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "key": key,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class Topic {
  Topic({
    this.id,
    this.courseId,
    this.orderCourse,
    this.name,
    this.nameFile,
    this.description,
    this.videoUrl,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? courseId;
  int? orderCourse;
  String? name;
  String? nameFile;
  String? description;
  dynamic videoUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Topic.fromMap(Map<String, dynamic> json) => Topic(
        id: json["id"],
        courseId: json["courseId"],
        orderCourse: json["orderCourse"],
        name: json["name"],
        nameFile: json["nameFile"],
        description: json["description"],
        videoUrl: json["videoUrl"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "courseId": courseId,
        "orderCourse": orderCourse,
        "name": name,
        "nameFile": nameFile,
        "description": description,
        "videoUrl": videoUrl,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
