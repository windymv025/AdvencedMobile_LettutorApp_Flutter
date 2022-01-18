import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/profile/profile.dart';
import 'package:flutter/cupertino.dart';

const double textSizeButton = 14;
const double textSizeTag = 12;
const double textSizeTitle = 16;
const double textSizePageName = 18;

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

// const kMainBlueColor = Color(0xff18A9FB);
const kMainBlueColor = Color(0xff248EEF);
const kPrimaryColor = Color(0xff1B67D9);
const kCardTeacherColor = Color(0xff127A90);
const kCardColor = Color(0xff128190);
const kDarkColor = Color(0xff222222);

//size screen

const kMobileBreakpoint = 576;
const kTabletBreakpoint = 1024;
const kDesktopBreakPoint = 1366;

const kWithMinDefault = 315;
const kHeightMinDefault = 540;

const kStringDarkTheme = "Dark";
const kStringLightTheme = "Light";
final kThemes = [kStringDarkTheme, kStringLightTheme];

const kLevels = [
  "Beginner",
  "Higher Beginner",
  "Pre-Intermediate",
  "Intermediate",
  "Upper-intermediate",
  "Advanced",
  "Proficiency",
];

final kMapLevels = {
  "BEGINNER": "Beginner",
  "HIGHER_BEGINNER": "Higher Beginner",
  "PRE_INTERMEDIATE": "Pre-Intermediate",
  "INTERMEDIATE": "Intermediate",
  "UPPER_INTERMEDIATE": "Upper-intermediate",
  "Advanced".toUpperCase(): "Advanced",
  "Proficiency".toUpperCase(): "Proficiency",
};

final kSpecialities = [
  kAllTeachers,
  "English for kids",
  "English for Business",
  "Conversational",
  "STARTERS",
  "MOVERS",
  "FLYERS",
  "KET",
  "PET",
  "IELTS",
  "TOEFL",
  "TOEIC",
];

final kLearnTopics = [
  LearnTopic(id: 1, key: "starters", name: "STARTERS"),
  LearnTopic(id: 2, key: "movers", name: "MOVERS"),
  LearnTopic(id: 3, key: "flyers", name: "FLYERS"),
  LearnTopic(id: 4, key: "ket", name: "KET"),
  LearnTopic(id: 5, key: "pet", name: "PET"),
  LearnTopic(id: 6, key: "ielts", name: "IELTS"),
  LearnTopic(id: 7, key: "toefl", name: "TOEFL"),
  LearnTopic(id: 8, key: "toeic", name: "TOEIC"),
];

final kTestPractices = [
  LearnTopic(id: 3, key: "english-for-kids", name: "English for Kids"),
  LearnTopic(id: 4, key: "business-english", name: "Business English"),
  LearnTopic(
      id: 5, key: "conversational-english", name: "Conversational English"),
];

const kLanguages = [
  "Algerian Arabic",
  "Amharic",
  "Assamese",
  "Bavarian",
  "Bengali",
  "Bhojpuri",
  "Burmese",
  "Cebuano",
  "Chhattisgarhi",
  "Chittagonian",
  "Czech",
  "Deccan",
  "Dutch",
  "Eastern Min",
  "Eastern Punjabi",
  "Egyptian Arabic",
  "English",
  "French",
  "Gan Chinese",
  "German",
  "Greek",
  "Gujarati",
  "Hakka",
  "Hausa",
  "Hejazi Arabic",
  "Hindi",
  "Hungarian",
  "Igbo",
  "Indonesian",
  "Iranian Persian",
  "Italian",
  "Japanese",
  "Javanese",
  "Jin Chinese",
  "Kannada",
  "Kazakh",
  "Khmer",
  "Kinyarwanda",
  "Korean",
  "Magahi",
  "Maithili",
  "Malayalam",
  "Malaysian",
  "Mandarin Chinese",
  "Marathi",
  "Mesopotamian Arabic",
  "Moroccan Arabic",
  "Nepali",
  "Nigerian Fulfulde",
  "North Levantine Arabic",
  "Northern Kurdish",
  "Northern Min",
  "Northern Pashto",
  "Northern Uzbek",
  "Odia",
  "Polish",
  "Portuguese",
  "Romanian",
  "Rundi",
  "Russian",
  "Sa'idi Arabic",
  "Sanaani Spoken Arabic",
  "Saraiki",
  "Sindhi",
  "Sinhalese",
  "Somali",
  "South Azerbaijani",
  "South Levantine Arabic",
  "Southern Min",
  "Southern Pashto",
  "Spanish",
  "Sudanese Arabic",
  "Sunda",
  "Sylheti",
  "Tagalog",
  "Ta'izzi-Adeni Arabic",
  "Tamil",
  "Telugu",
  "Thai",
  "Tunisian Arabic",
  "Turkish",
  "Ukrainian",
  "Urdu",
  "Uyghur",
  "Vietnamese",
  "Western Punjabi",
  "Wu Chinese",
  "Xiang Chinese",
  "Yoruba",
  "Yue Chinese",
  "Zulu"
];

const kAllTeachers = "All";

const String sep1Content =
    """Your tutor profile is your chance to market yourself to students on Tutoring. You can make edits later on your profile settings page.

New students may browse tutor profiles to find a tutor that fits their learning goals and personality. Returning students may use the tutor profiles to find tutors they've had great experiences with already.""";

const String step2Content =
    "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.";

final String videoTips = S.current.video_tips;

const String dot = " • ";
