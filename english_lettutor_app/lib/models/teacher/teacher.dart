import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/models/profile/profile.dart';

import 'rating_comment.dart';

class Teacher {
  int id = 0;
  String? uriVideo;
  String? uriImage;
  String? name;
  String? description;
  List<String>? languages;
  String? education;
  String? experience;
  String? interests;
  String? profession;
  List<String>? specialties;
  double? ratings;
  List<RatingComment>? ratingComments;
  List<DateTime>? freeDate;
  bool? isOnline;
  bool isFavorite = false;
  String country = '';
  DateTime? birthday;

  String? level;

  Teacher({
    required this.id,
    required this.name,
    required this.specialties,
    required this.country,
    this.uriImage,
    required this.description,
    this.education,
    this.experience,
    this.interests,
    this.languages,
    this.profession,
    this.freeDate,
    this.ratings = 0,
    this.isOnline,
    this.isFavorite = false,
  });

  Teacher.toProfile(Profile profile) {
    id = profile.id;
    name = profile.fullName;
    country = profile.country ?? '';
    birthday = profile.birthday;
    languages = [];
    specialties = [];
  }

  Teacher.getDefault() {
    id = 1;
    name = "Pham Minh Vuong";
    uriImage = Assets.assetsImagesLargeLogo;
    uriVideo =
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
    description =
        "Hi, I am teacher Nhi. I have been teaching English for 2 years. I used to study abroad in Sydney for 7 years. During my time as an overseas student, I had spoken with many people from diverse cultural backgrounds; therefore, I have strong listening and speaking skills. I love teaching English and I will devote to helping you improve your English skills if you book my class. I am also patient and understanding because I know for many people, English is a tough language to master. In my class, I will help you correct your pronunciation and deliver the lessons in a way that is easy for you to understand. If you book my class, you will have many chances to practice your speaking skills and also improve your pronunciation and grammatical knowledge. Besides that, if you need me to, I will share my personal tips to study English more effectively with you and show you the importance of having fun and practice while learning English. As an English teacher, I constantly update my English knowledge to better serve my career and students.";
    languages = ["English", "French"];
    education = "Bachelor from University of Technology";
    experience =
        """• ESL Teacher (September 12, 2016 -December 2017) SMEAG Sparta Campus, Talamban, Cebu, Philippines +63 (32) 345 6430 www.smenglish.com 
• ESL Teacher/Cambridge English (January 2018 – February 2020) SMEAG Sparta Campus, Mabolo, Cebu, Philippines - Bookmaker for YLE students & A2-B2 
• ONLINE TEACHING Home-based (March 2020 – Present) Private students""";
    interests =
        "Listening to music , Watching English movies, Gardening, Baking, Cooking ,craft making , Adult coloring, Go hiking with my family ,swimming and fishing.";
    profession = "Teaching Assistant at ILA Vietnam";

    specialties = [
      "English for kids",
      "English for Business",
      "Conversational",
      "TOEIC",
      "STARTERS"
    ];

    ratings = 3.5;

    ratingComments = [
      RatingComment.getDefault(),
      RatingComment.getDefault(),
      RatingComment.getDefault()
    ];

    freeDate = [
      DateTime.now(),
      DateTime.now(),
      DateTime.utc(2021, 10, 25),
      DateTime(2021),
      DateTime(2020)
    ];
    isOnline = true;
    isFavorite = false;
    country = "Vietnam";
  }

  Teacher.getDefault2() {
    id = 2;
    name = "Windy Pham";
    uriImage = Assets.assetsImagesCloudData;
    specialties = ["English"];
    uriVideo =
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
    description =
        "Hi, I am teacher Nhi. I have been teaching English for 2 years. I used to study abroad in Sydney for 7 years. During my time as an overseas student, I had spoken with many people from diverse cultural backgrounds; therefore, I have strong listening and speaking skills. I love teaching English and I will devote to helping you improve your English skills if you book my class. I am also patient and understanding because I know for many people, English is a tough language to master. In my class, I will help you correct your pronunciation and deliver the lessons in a way that is easy for you to understand. If you book my class, you will have many chances to practice your speaking skills and also improve your pronunciation and grammatical knowledge. Besides that, if you need me to, I will share my personal tips to study English more effectively with you and show you the importance of having fun and practice while learning English. As an English teacher, I constantly update my English knowledge to better serve my career and students.";
    languages = ["English", "French"];
    education = "Bachelor from University of Technology";
    experience =
        """• ESL Teacher (September 12, 2016 -December 2017) SMEAG Sparta Campus, Talamban, Cebu, Philippines +63 (32) 345 6430 www.smenglish.com 
• ESL Teacher/Cambridge English (January 2018 – February 2020) SMEAG Sparta Campus, Mabolo, Cebu, Philippines - Bookmaker for YLE students & A2-B2 
• ONLINE TEACHING Home-based (March 2020 – Present) Private students""";
    interests =
        "Listening to music , Watching English movies, Gardening, Baking, Cooking ,craft making , Adult coloring, Go hiking with my family ,swimming and fishing.";
    profession = "Teaching Assistant at ILA Vietnam";

    specialties = ["English for kids", "Conversational", "TOEIC", "STARTERS"];

    ratings = 3.0;

    ratingComments = [RatingComment.getDefault(), RatingComment.getDefault()];

    freeDate = [
      DateTime.now(),
      DateTime.utc(2021, 10, 25),
      DateTime(2021),
      DateTime(2020)
    ];
    isOnline = false;
    isFavorite = true;
    country = "USA";
  }

  Teacher.getDefault3() {
    id = 3;
    name = "nhi lam";
    uriImage = Assets.assetsImagesLargeLogo;
    uriVideo =
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
    description =
        "Hi, I am teacher Nhi. I have been teaching English for 2 years. I used to study abroad in Sydney for 7 years. During my time as an overseas student, I had spoken with many people from diverse cultural backgrounds; therefore, I have strong listening and speaking skills. I love teaching English and I will devote to helping you improve your English skills if you book my class. I am also patient and understanding because I know for many people, English is a tough language to master. In my class, I will help you correct your pronunciation and deliver the lessons in a way that is easy for you to understand. If you book my class, you will have many chances to practice your speaking skills and also improve your pronunciation and grammatical knowledge. Besides that, if you need me to, I will share my personal tips to study English more effectively with you and show you the importance of having fun and practice while learning English. As an English teacher, I constantly update my English knowledge to better serve my career and students.";
    languages = ["English", "French"];
    education = "Bachelor from University of Technology";
    experience =
        """• ESL Teacher (September 12, 2016 -December 2017) SMEAG Sparta Campus, Talamban, Cebu, Philippines +63 (32) 345 6430 www.smenglish.com 
• ESL Teacher/Cambridge English (January 2018 – February 2020) SMEAG Sparta Campus, Mabolo, Cebu, Philippines - Bookmaker for YLE students & A2-B2 
• ONLINE TEACHING Home-based (March 2020 – Present) Private students""";
    interests =
        "Listening to music , Watching English movies, Gardening, Baking, Cooking ,craft making , Adult coloring, Go hiking with my family ,swimming and fishing.";
    profession = "Teaching Assistant at ILA Vietnam";

    specialties = [
      "English for kids",
      "Conversational",
      "English for Business"
    ];

    ratings = 5;

    ratingComments = [
      RatingComment.getDefault(),
      RatingComment.getDefault(),
      RatingComment.getDefault()
    ];

    freeDate = [
      DateTime.now(),
      DateTime.utc(2021, 10, 25),
      DateTime(2021),
      DateTime(2020)
    ];
    isOnline = true;
    country = "Campuchia";
  }

  Teacher.getDefault4() {
    id = 4;
    name = "Michelle Roque";
    uriImage = Assets.assetsImagesLargeLogo;
    uriVideo =
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
    description =
        "Hi, I am teacher Nhi. I have been teaching English for 2 years. I used to study abroad in Sydney for 7 years. During my time as an overseas student, I had spoken with many people from diverse cultural backgrounds; therefore, I have strong listening and speaking skills. I love teaching English and I will devote to helping you improve your English skills if you book my class. I am also patient and understanding because I know for many people, English is a tough language to master. In my class, I will help you correct your pronunciation and deliver the lessons in a way that is easy for you to understand. If you book my class, you will have many chances to practice your speaking skills and also improve your pronunciation and grammatical knowledge. Besides that, if you need me to, I will share my personal tips to study English more effectively with you and show you the importance of having fun and practice while learning English. As an English teacher, I constantly update my English knowledge to better serve my career and students.";
    languages = ["English", "French"];
    education = "Bachelor from University of Technology";
    experience =
        """• ESL Teacher (September 12, 2016 -December 2017) SMEAG Sparta Campus, Talamban, Cebu, Philippines +63 (32) 345 6430 www.smenglish.com 
• ESL Teacher/Cambridge English (January 2018 – February 2020) SMEAG Sparta Campus, Mabolo, Cebu, Philippines - Bookmaker for YLE students & A2-B2 
• ONLINE TEACHING Home-based (March 2020 – Present) Private students""";
    interests =
        "Listening to music , Watching English movies, Gardening, Baking, Cooking ,craft making , Adult coloring, Go hiking with my family ,swimming and fishing.";
    profession = "Teaching Assistant at ILA Vietnam";

    specialties = [
      "English for kids",
      "English for Business",
      "Conversational",
      "TOEIC",
      "STARTERS"
    ];

    ratings = 2;

    ratingComments = [
      RatingComment.getDefault(),
      RatingComment.getDefault(),
      RatingComment.getDefault()
    ];

    freeDate = [
      DateTime.now(),
      DateTime.utc(2021, 10, 25),
      DateTime(2021),
      DateTime(2020)
    ];
    isOnline = true;
    isFavorite = true;
    country = "USA";
  }
}
