class AppConstants {}

class ScreenUtilConfig {
  static const double screenWidth = 375;
  static const double screenHeight = 812;
}

class NetworkStatus {
  static const int notAuthorized = 401;
  static const int notFound = 404;
  static const int forbidden = 403;
  static const int successAccount = 200;
  static const String successDeviga = 'SUCCESS';
  static const String successUpload = 'OK';
}

class Constants {
  static const int maxPhoneNumberLength = 15;
  static const int minPhoneNumberLength = 5;
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 50;
  static const int maxAccountLength = 50;
  static const int maxPhoneLength = 15;
  static const int maxOtpLength = 6;

  static const String defaultLocale = vietnamese;
  static const String vietnamese = "vi";
  static const String english = "en";
  static const int otpLength = 6;

  static const String forgotUsernameType = 'username';
  static const String forgotPhoneType = 'phone';

  static const String darkMode = "darkMode";
  static const String lightMode = "lightMode";
  static const String baseServiceNameMetaWorld = 'PINDIASDEV';
  static const int limitPage = 20;
}

class PrefKeys {
  static const String token = 'token';
  static const String loginType = 'loginType';
  static const String refreshToken = 'refreshToken';
  // static const String endodifeToken = 'divegaToken';
  static const String applicationId = 'applicationId';
  static const String exchangeRate = 'exchangeRate';
  static const String scope = 'scope';
  static const String firstOpen = 'firstOpen';
  static const String tokenType = 'tokenType';
  static const String session = 'session';
  static const String user = 'user';
  // static const String userEndolife = 'userEndolife';
  static const String changeLanguage = 'changeLanguage';
  static const String localAuth = 'localAuth';
  static const String locale = 'locale';
  static const String themeMode = 'themeMode';
  static const String myStore = 'myStore';
  // static const String avatarDefault =
  // 'https://dev-api.endolife.vn/images/icon-divega.jpg';
}
