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
const kStringSystemTheme = "System";
final kThemes = [kStringDarkTheme, kStringLightTheme];

const kLevels = [
  "Any level",
  "Beginner",
  "Upper-Beginner",
  "Pre-Intermediate",
  "Intermediate",
  "Upper-Intermediate",
  "Pre-Advanced",
  "Advanced",
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
  "English for Kids",
  "Business English",
  "Conversational English",
  "STARTERS",
  "MOVERS",
  "FLYERS",
  "KET",
  "PET",
  "IELTS",
  "TOEFL",
  "TOEIC",
];

final kMapSpecialities = <String, String>{
  kAllTeachers: kAllTeachers,
  "english-for-kids": "English for Kids",
  "business-english": "Business English",
  "conversational-english": "Conversational English",
  "starters": "STARTERS",
  "movers": "MOVERS",
  "flyers": "FLYERS",
  "ket": "KET",
  "pet": "PET",
  "ielts": "IELTS",
  "toefl": "TOEFL",
  "toeic": "TOEIC",
};

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

final kMapCountry = {
  "AL": "Albania",
  "DZ": "Algeria",
  "AD": "Andorra",
  "AO": "Angola",
  "AG": "Antigua and Barbuda",
  "AR": "Argentina",
  "AM": "Armenia",
  "AU": "Australia",
  "AT": "Austria",
  "AZ": "Azerbaijan",
  "BS": "Bahamas",
  "BH": "Bahrain",
  "BD": "Bangladesh",
  "BB": "Barbados",
  "BY": "Belarus",
  "BE": "Belgium",
  "BZ": "Belize",
  "BJ": "Benin",
  "BT": "Bhutan",
  "BO": "Bolivia (Plurinational State of)",
  "BA": "Bosnia and Herzegovina",
  "BW": "Botswana",
  "BR": "Brazil",
  "BN": "Brunei Darussalam",
  "BG": "Bulgaria",
  "BF": "Burkina Faso",
  "BI": "Burundi",
  "CV": "Cabo Verde",
  "KH": "Cambodia",
  "CM": "Cameroon",
  "CA": "Canada",
  "CF": "Central African Republic",
  "TD": "Chad",
  "CL": "Chile",
  "CN": "China",
  "CO": "Colombia",
  "KM": "Comoros",
  "CG": "Congo",
  "CK": "Cook Islands",
  "CR": "Costa Rica",
  "HR": "Croatia",
  "CU": "Cuba",
  "CY": "Cyprus",
  "CZ": "Czechia",
  "CI": "C??te d'Ivoire",
  "KP": "Democratic People's Republic of Korea",
  "CD": "Democratic Republic of the Congo",
  "DK": "Denmark",
  "DJ": "Djibouti",
  "DM": "Dominica",
  "DO": "Dominican Republic",
  "EC": "Ecuador",
  "EG": "Egypt",
  "SV": "El Salvador",
  "GQ": "Equatorial Guinea",
  "ER": "Eritrea",
  "EE": "Estonia",
  "SZ": "Eswatini",
  "ET": "Ethiopia",
  "FO": "Faroe Islands",
  "FJ": "Fiji",
  "FI": "Finland",
  "FR": "France",
  "GA": "Gabon",
  "GM": "Gambia",
  "GE": "Georgia",
  "DE": "Germany",
  "GH": "Ghana",
  "GR": "Greece",
  "GD": "Grenada",
  "GT": "Guatemala",
  "GN": "Guinea",
  "GW": "Guinea-Bissau",
  "GY": "Guyana",
  "HT": "Haiti",
  "HN": "Honduras",
  "HU": "Hungary",
  "IS": "Iceland",
  "IN": "India",
  "ID": "Indonesia",
  "IR": "Iran (Islamic Republic of)",
  "IQ": "Iraq",
  "IE": "Ireland",
  "IL": "Israel",
  "IT": "Italy",
  "JM": "Jamaica",
  "JP": "Japan",
  "JO": "Jordan",
  "KZ": "Kazakhstan",
  "KE": "Kenya",
  "KI": "Kiribati",
  "KW": "Kuwait",
  "KG": "Kyrgyzstan",
  "LA": "Lao People's Democratic Republic",
  "LV": "Latvia",
  "LB": "Lebanon",
  "LS": "Lesotho",
  "LR": "Liberia",
  "LY": "Libya",
  "LT": "Lithuania",
  "LU": "Luxembourg",
  "MG": "Madagascar",
  "MW": "Malawi",
  "MY": "Malaysia",
  "MV": "Maldives",
  "ML": "Mali",
  "MT": "Malta",
  "MH": "Marshall Islands",
  "MR": "Mauritania",
  "MU": "Mauritius",
  "MX": "Mexico",
  "FM": "Micronesia (Federated States of)",
  "MC": "Monaco",
  "MN": "Mongolia",
  "ME": "Montenegro",
  "MA": "Morocco",
  "MZ": "Mozambique",
  "MM": "Myanmar",
  "NA": "Namibia",
  "NR": "Nauru",
  "NP": "Nepal",
  "NL": "Netherlands",
  "NZ": "New Zealand",
  "NI": "Nicaragua",
  "NE": "Niger",
  "NG": "Nigeria",
  "NU": "Niue",
  "MK": "North Macedonia",
  "NO": "Norway",
  "OM": "Oman",
  "PK": "Pakistan",
  "PW": "Palau",
  "PA": "Panama",
  "PG": "Papua New Guinea",
  "PY": "Paraguay",
  "PE": "Peru",
  "PH": "Philippines",
  "PL": "Poland",
  "PT": "Portugal",
  "QA": "Qatar",
  "KR": "Republic of Korea",
  "MD": "Republic of Moldova",
  "RO": "Romania",
  "RU": "Russian Federation",
  "RW": "Rwanda",
  "KN": "Saint Kitts and Nevis",
  "LC": "Saint Lucia",
  "VC": "Saint Vincent and the Grenadines",
  "WS": "Samoa",
  "SM": "San Marino",
  "ST": "Sao Tome and Principe",
  "SA": "Saudi Arabia",
  "SN": "Senegal",
  "RS": "Serbia",
  "SC": "Seychelles",
  "SL": "Sierra Leone",
  "SG": "Singapore",
  "SK": "Slovakia",
  "SI": "Slovenia",
  "SB": "Solomon Islands",
  "SO": "Somalia",
  "ZA": "South Africa",
  "SS": "South Sudan",
  "ES": "Spain",
  "LK": "Sri Lanka",
  "SD": "Sudan",
  "SR": "Suriname",
  "SE": "Sweden",
  "CH": "Switzerland",
  "SY": "Syrian Arab Republic",
  "TJ": "Tajikistan",
  "TH": "Thailand",
  "TL": "Timor-Leste",
  "TG": "Togo",
  "TK": "Tokelau",
  "TO": "Tonga",
  "TT": "Trinidad and Tobago",
  "TN": "Tunisia",
  "TR": "Turkey",
  "TM": "Turkmenistan",
  "TV": "Tuvalu",
  "UG": "Uganda",
  "UA": "Ukraine",
  "AE": "United Arab Emirates",
  "GB": "United Kingdom of Great Britain and Northern Ireland",
  "TZ": "United Republic of Tanzania",
  "US": "United States of America",
  "UY": "Uruguay",
  "UZ": "Uzbekistan",
  "VU": "Vanuatu",
  "VE": "Venezuela (Bolivarian Republic of)",
  "VN": "Viet Nam",
  "YE": "Yemen",
  "ZM": "Zambia",
  "ZW": "Zimbabwe"
};

final kMapLanguages = {
  "af": "Afrikaans",
  "af-ZA": "Afrikaans (South Africa)",
  "ar": "Arabic",
  "ar-AE": "Arabic (U.A.E.)",
  "ar-BH": "Arabic (Bahrain)",
  "ar-DZ": "Arabic (Algeria)",
  "ar-EG": "Arabic (Egypt)",
  "ar-IQ": "Arabic (Iraq)",
  "ar-JO": "Arabic (Jordan)",
  "ar-KW": "Arabic (Kuwait)",
  "ar-LB": "Arabic (Lebanon)",
  "ar-LY": "Arabic (Libya)",
  "ar-MA": "Arabic (Morocco)",
  "ar-OM": "Arabic (Oman)",
  "ar-QA": "Arabic (Qatar)",
  "ar-SA": "Arabic (Saudi Arabia)",
  "ar-SY": "Arabic (Syria)",
  "ar-TN": "Arabic (Tunisia)",
  "ar-YE": "Arabic (Yemen)",
  "az": "Azeri (Latin)",
  "az-AZ": "Azeri (Latin) (Azerbaijan)",
  "be": "Belarusian",
  "be-BY": "Belarusian (Belarus)",
  "bg": "Bulgarian",
  "bg-BG": "Bulgarian (Bulgaria)",
  "bs-BA": "Bosnian (Bosnia and Herzegovina)",
  "ca": "Catalan",
  "ca-ES": "Catalan (Spain)",
  "cs": "Czech",
  "cs-CZ": "Czech (Czech Republic)",
  "cy": "Welsh",
  "cy-GB": "Welsh (United Kingdom)",
  "da": "Danish",
  "da-DK": "Danish (Denmark)",
  "de": "German",
  "de-AT": "German (Austria)",
  "de-CH": "German (Switzerland)",
  "de-DE": "German (Germany)",
  "de-LI": "German (Liechtenstein)",
  "de-LU": "German (Luxembourg)",
  "dv": "Divehi",
  "dv-MV": "Divehi (Maldives)",
  "el": "Greek",
  "el-GR": "Greek (Greece)",
  "en": "English",
  "en-AU": "English (Australia)",
  "en-BZ": "English (Belize)",
  "en-CA": "English (Canada)",
  "en-CB": "English (Caribbean)",
  "en-GB": "English (United Kingdom)",
  "en-IE": "English (Ireland)",
  "en-JM": "English (Jamaica)",
  "en-NZ": "English (New Zealand)",
  "en-PH": "English (Republic of the Philippines)",
  "en-TT": "English (Trinidad and Tobago)",
  "en-US": "English (United States)",
  "en-ZA": "English (South Africa)",
  "en-ZW": "English (Zimbabwe)",
  "eo": "Esperanto",
  "es": "Spanish",
  "es-AR": "Spanish (Argentina)",
  "es-BO": "Spanish (Bolivia)",
  "es-CL": "Spanish (Chile)",
  "es-CO": "Spanish (Colombia)",
  "es-CR": "Spanish (Costa Rica)",
  "es-DO": "Spanish (Dominican Republic)",
  "es-EC": "Spanish (Ecuador)",
  "es-ES": "Spanish (Castilian)",
  "es-GT": "Spanish (Guatemala)",
  "es-HN": "Spanish (Honduras)",
  "es-MX": "Spanish (Mexico)",
  "es-NI": "Spanish (Nicaragua)",
  "es-PA": "Spanish (Panama)",
  "es-PE": "Spanish (Peru)",
  "es-PR": "Spanish (Puerto Rico)",
  "es-PY": "Spanish (Paraguay)",
  "es-SV": "Spanish (El Salvador)",
  "es-UY": "Spanish (Uruguay)",
  "es-VE": "Spanish (Venezuela)",
  "et": "Estonian",
  "et-EE": "Estonian (Estonia)",
  "eu": "Basque",
  "eu-ES": "Basque (Spain)",
  "fa": "Farsi",
  "fa-IR": "Farsi (Iran)",
  "fi": "Finnish",
  "fi-FI": "Finnish (Finland)",
  "fo": "Faroese",
  "fo-FO": "Faroese (Faroe Islands)",
  "fr": "French",
  "fr-BE": "French (Belgium)",
  "fr-CA": "French (Canada)",
  "fr-CH": "French (Switzerland)",
  "fr-FR": "French (France)",
  "fr-LU": "French (Luxembourg)",
  "fr-MC": "French (Principality of Monaco)",
  "gl": "Galician",
  "gl-ES": "Galician (Spain)",
  "gu": "Gujarati",
  "gu-IN": "Gujarati (India)",
  "he": "Hebrew",
  "he-IL": "Hebrew (Israel)",
  "hi": "Hindi",
  "hi-IN": "Hindi (India)",
  "hr": "Croatian",
  "hr-BA": "Croatian (Bosnia and Herzegovina)",
  "hr-HR": "Croatian (Croatia)",
  "hu": "Hungarian",
  "hu-HU": "Hungarian (Hungary)",
  "hy": "Armenian",
  "hy-AM": "Armenian (Armenia)",
  "id": "Indonesian",
  "id-ID": "Indonesian (Indonesia)",
  "is": "Icelandic",
  "is-IS": "Icelandic (Iceland)",
  "it": "Italian",
  "it-CH": "Italian (Switzerland)",
  "it-IT": "Italian (Italy)",
  "ja": "Japanese",
  "ja-JP": "Japanese (Japan)",
  "ka": "Georgian",
  "ka-GE": "Georgian (Georgia)",
  "kk": "Kazakh",
  "kk-KZ": "Kazakh (Kazakhstan)",
  "kn": "Kannada",
  "kn-IN": "Kannada (India)",
  "ko": "Korean",
  "ko-KR": "Korean (Korea)",
  "kok": "Konkani",
  "kok-IN": "Konkani (India)",
  "ky": "Kyrgyz",
  "ky-KG": "Kyrgyz (Kyrgyzstan)",
  "lt": "Lithuanian",
  "lt-LT": "Lithuanian (Lithuania)",
  "lv": "Latvian",
  "lv-LV": "Latvian (Latvia)",
  "mi": "Maori",
  "mi-NZ": "Maori (New Zealand)",
  "mk": "FYRO Macedonian",
  "mk-MK": "FYRO Macedonian (Former Yugoslav Republic of Macedonia)",
  "mn": "Mongolian",
  "mn-MN": "Mongolian (Mongolia)",
  "mr": "Marathi",
  "mr-IN": "Marathi (India)",
  "ms": "Malay",
  "ms-BN": "Malay (Brunei Darussalam)",
  "ms-MY": "Malay (Malaysia)",
  "mt": "Maltese",
  "mt-MT": "Maltese (Malta)",
  "nb": "Norwegian (Bokm?l)",
  "nb-NO": "Norwegian (Bokm?l) (Norway)",
  "nl": "Dutch",
  "nl-BE": "Dutch (Belgium)",
  "nl-NL": "Dutch (Netherlands)",
  "nn-NO": "Norwegian (Nynorsk) (Norway)",
  "ns": "Northern Sotho",
  "ns-ZA": "Northern Sotho (South Africa)",
  "pa": "Punjabi",
  "pa-IN": "Punjabi (India)",
  "pl": "Polish",
  "pl-PL": "Polish (Poland)",
  "ps": "Pashto",
  "ps-AR": "Pashto (Afghanistan)",
  "pt": "Portuguese",
  "pt-BR": "Portuguese (Brazil)",
  "pt-PT": "Portuguese (Portugal)",
  "qu": "Quechua",
  "qu-BO": "Quechua (Bolivia)",
  "qu-EC": "Quechua (Ecuador)",
  "qu-PE": "Quechua (Peru)",
  "ro": "Romanian",
  "ro-RO": "Romanian (Romania)",
  "ru": "Russian",
  "ru-RU": "Russian (Russia)",
  "sa": "Sanskrit",
  "sa-IN": "Sanskrit (India)",
  "se": "Sami (Northern)",
  "se-FI": "Sami (Northern) (Finland)",
  "se-NO": "Sami (Northern) (Norway)",
  "se-SE": "Sami (Northern) (Sweden)",
  "sk": "Slovak",
  "sk-SK": "Slovak (Slovakia)",
  "sl": "Slovenian",
  "sl-SI": "Slovenian (Slovenia)",
  "sq": "Albanian",
  "sq-AL": "Albanian (Albania)",
  "sr-BA": "Serbian (Latin) (Bosnia and Herzegovina)",
  "sr-SP": "Serbian (Latin) (Serbia and Montenegro)",
  "sv": "Swedish",
  "sv-FI": "Swedish (Finland)",
  "sv-SE": "Swedish (Sweden)",
  "sw": "Swahili",
  "sw-KE": "Swahili (Kenya)",
  "syr": "Syriac",
  "syr-SY": "Syriac (Syria)",
  "ta": "Tamil",
  "ta-IN": "Tamil (India)",
  "te": "Telugu",
  "te-IN": "Telugu (India)",
  "th": "Thai",
  "th-TH": "Thai (Thailand)",
  "tl": "Tagalog",
  "tl-PH": "Tagalog (Philippines)",
  "tn": "Tswana",
  "tn-ZA": "Tswana (South Africa)",
  "tr": "Turkish",
  "tr-TR": "Turkish (Turkey)",
  "tt": "Tatar",
  "tt-RU": "Tatar (Russia)",
  "ts": "Tsonga",
  "uk": "Ukrainian",
  "uk-UA": "Ukrainian (Ukraine)",
  "ur": "Urdu",
  "ur-PK": "Urdu (Islamic Republic of Pakistan)",
  "uz": "Uzbek (Latin)",
  "uz-UZ": "Uzbek (Latin) (Uzbekistan)",
  "vi": "Vietnamese",
  "vi-VN": "Vietnamese (Viet Nam)",
  "xh": "Xhosa",
  "xh-ZA": "Xhosa (South Africa)",
  "zh": "Chinese",
  "zh-CN": "Chinese (S)",
  "zh-HK": "Chinese (Hong Kong)",
  "zh-MO": "Chinese (Macau)",
  "zh-SG": "Chinese (Singapore)",
  "zh-TW": "Chinese (T)",
  "zu": "Zulu",
  "zu-ZA": "Zulu (South Africa)"
};

const kAllTeachers = "All";
const kAll = "Any level";

const String sep1Content =
    """Your tutor profile is your chance to market yourself to students on Tutoring. You can make edits later on your profile settings page.

New students may browse tutor profiles to find a tutor that fits their learning goals and personality. Returning students may use the tutor profiles to find tutors they've had great experiences with already.""";

const String step2Content =
    "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.";

final String videoTips = S.current.video_tips;

const String dot = " ??? ";
