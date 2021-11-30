import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/constants/constants.dart';

class Course {
  String? image;
  String? name;
  String? subtitle;
  String? level;
  int lessons = 0;
  String? whyTakeCourse;
  String? whatBeAbleToDo;
  List<String>? topics;

  Course(
      {required this.image,
      required this.name,
      required this.subtitle,
      required this.level,
      this.lessons = 0,
      this.topics,
      this.whatBeAbleToDo,
      this.whyTakeCourse});

  Course.getDefault() {
    image = Assets.assetsImagesCloudData;
    name = "Basic Conversation";
    subtitle = "Gain confidence speaking about familiar topics";
    level = kLevels[0];
    lessons = 5;
    whyTakeCourse =
        "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.";
    whatBeAbleToDo =
        "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.";
    topics = [
      "Foods You Love",
      "Your Job",
      "Playing and Watching Sports",
      "The Best Pet",
      "Having Fun in Your Free Time",
      "Your Daily Routine",
      "Childhood Memories",
      "Your Family Members",
      "Your Hometown",
      "Shopping Habits"
    ];
  }

  Course.getDefault1() {
    image = Assets.assetsImagesLargeLogo;
    name = "Basic Speaker";
    subtitle = "Gain confidence speaking about familiar topics";
    level = kLevels[2];
    lessons = 5;
    whyTakeCourse =
        "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.";
    whatBeAbleToDo =
        "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.";
    topics = [
      "Foods You Love",
      "Your Job",
      "Playing and Watching Sports",
      "The Best Pet",
      "Having Fun in Your Free Time",
      "Your Daily Routine",
      "Childhood Memories",
      "Your Family Members",
      "Your Hometown",
      "Shopping Habits"
    ];
  }

  Course.getDefault2() {
    image = Assets.assetsImagesNoDataFound;
    name = "Advanced Speaker";
    subtitle = "Gain confidence speaking about familiar topics";
    level = kLevels[1];
    lessons = 7;
    whyTakeCourse =
        "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.";
    whatBeAbleToDo =
        "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.";
    topics = [
      "Foods You Love",
      "Your Job",
      "Playing and Watching Sports",
      "The Best Pet",
      "Having Fun in Your Free Time",
      "Your Daily Routine",
      "Childhood Memories",
      "Your Family Members",
      "Your Hometown",
      "Shopping Habits"
    ];
  }
}
