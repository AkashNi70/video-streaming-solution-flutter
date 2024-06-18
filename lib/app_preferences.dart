import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();
  factory AppPreferences() => _instance;

  late SharedPreferences _preferences;

  // Private constructor for singleton
  AppPreferences._internal();

  // Constants for preference keys
  static const String _prefName = "VideoStreamingApp";
  static const String _isLoggedInKey = "IsLoggedIn";
  static const String _isLoggedRememberKey = "IsLoggedRemember";
  static const String _isDarkMode = "IsLoggedRemember";
  static const String _userIdKey = "user_id";
  static const String _userNameKey = "user_name";
  static const String _emailKey = "email";
  static const String _phoneKey = "phone";
  static const String _loginTypeKey = "login_type";
  static const String _consentKey = "consent";
  static const String _notificationKey = "IsNotification";
  static const String _introductionKey = "IsIntroduction";
  static const String _userSessionKey = "user_session";
  static const String _deviceLimitKey = "IsDeviceLimit";
  static const String _passwordKey = "remember_password";
  static const String _isFirstTimeKey = "isFirstTime";


  /// Initializes the SharedPreferences instance
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Sets the 'isFirstTime' flag
  Future<void> setFirstTime(bool isFirstTime) async {
    await _preferences.setBool(_isFirstTimeKey, isFirstTime);
  }

  /// Saves the login state
  Future<void> saveIsLogin(bool flag) async {
    await _preferences.setBool(_isLoggedInKey, flag);
    if (!flag) {
      await saveLogin("", "", "", "");
    }
  }

  /// Retrieves the login state
  bool getIsLogin() {
    return _preferences.getBool(_isLoggedInKey) ?? false;
  }

  /// Sets user consent
  Future<void> setConsent(bool consent) async {
    await _preferences.setBool(_consentKey, consent);
  }

  /// Gets user consent
  bool getConsent() {
    return _preferences.getBool(_consentKey) ?? false;
  }

  ///save dark mode data
  Future<void> saveIsDarkMode(bool flag) async{
    await _preferences.setBool(_isDarkMode, flag);
  }

  /// Retrieves the dark mode data
  bool getIsDarkMode(){
    return _preferences.getBool(_isDarkMode) ?? false;
  }

  /// Saves the remember login state
  Future<void> saveIsRemember(bool flag) async {
    await _preferences.setBool(_isLoggedRememberKey, flag);
  }

  /// Retrieves the remember login state
  bool getIsRemember() {
    return _preferences.getBool(_isLoggedRememberKey) ?? false;
  }

  /// Saves remember email and password
  Future<void> saveRemember(String email, String password) async {
    await _preferences.setString(_emailKey, email);
    await _preferences.setString(_passwordKey, password);
  }

  /// Saves user login information
  Future<void> saveLogin(String userId, String userName, String email, String phone) async {
    await _preferences.setString(_userIdKey, userId);
    await _preferences.setString(_userNameKey, userName);
    await _preferences.setString(_emailKey, email);
    await _preferences.setString(_phoneKey, phone);
  }

  /// Retrieves the user ID
  String getUserId() {
    return _preferences.getString(_userIdKey) ?? "";
  }

  /// Retrieves the user name
  String getUserName() {
    return _preferences.getString(_userNameKey) ?? "";
  }

  /// Retrieves the user email
  String getUserEmail() {
    return _preferences.getString(_emailKey) ?? "";
  }

  /// Retrieves the user phone number
  String getUserPhone() {
    return _preferences.getString(_phoneKey) ?? "";
  }

  /// Saves the login type
  Future<void> saveLoginType(String type) async {
    await _preferences.setString(_loginTypeKey, type);
  }

  /// Retrieves the login type
  String getLoginType() {
    return _preferences.getString(_loginTypeKey) ?? "";
  }

  /// Saves the notification state
  Future<void> saveIsNotification(bool flag) async {
    await _preferences.setBool(_notificationKey, flag);
  }

  /// Retrieves the notification state
  bool getNotification() {
    return _preferences.getBool(_notificationKey) ?? true;
  }

  /// Saves the introduction state
  Future<void> saveIsIntroduction(bool flag) async {
    await _preferences.setBool(_introductionKey, flag);
  }

  /// Retrieves the introduction state
  bool getIsIntroduction() {
    return _preferences.getBool(_introductionKey) ?? false;
  }

  /// Saves the user session
  Future<void> saveUserSession(String sessionName) async {
    await _preferences.setString(_userSessionKey, sessionName);
  }

  /// Retrieves the user session
  String getUserSession() {
    return _preferences.getString(_userSessionKey) ?? "";
  }

  /// Saves the device limit state
  Future<void> saveDeviceLimit(bool flag) async {
    await _preferences.setBool(_deviceLimitKey, flag);
  }

  /// Retrieves the device limit state
  bool getDeviceLimitReached() {
    return _preferences.getBool(_deviceLimitKey) ?? false;
  }
}
