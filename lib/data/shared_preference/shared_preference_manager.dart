import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  static final SharedPreferenceManager _instance = SharedPreferenceManager._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory SharedPreferenceManager() {
    return _instance;
  }


  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  SharedPreferenceManager._internal() {
    // initialization logic
  }


  // USER NAME
  Future<void> setUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', name);
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName');
  }


  // USER ID
  Future<void> setUserID(int id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('userID', id);
  }

  Future<int?> getUserID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userID');
  }


  // USER EMAIL
  Future<void> setUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userEmail', email);
  }

  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }


  // EMAIL VERIFIED DATE
  Future<void> setEmailVerifiedAt(String date) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('emailVerifiedAt', date);
  }

  Future<String?> getEmailVerifiedAt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('emailVerifiedAt');
  }


  // ACCESS TOKEN
  Future<void> setAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('accessToken', token);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  // SHOW WELCOME SLIDES
  Future<void> setShownWelcomeSlides(bool value) async {
    // if value = true, welcome slides have been shown
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('shownWelcomeSlides', value);
  }

  Future<bool?> getShownWelcomeSlides() async {
    // if value = true, welcome slides have been shown
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('shownWelcomeSlides');
  }
}


/// REFERENCES
/// https://docs.flutter.dev/cookbook/persistence/key-value
/// https://flutterbyexample.com/lesson/singletons
/// https://stackoverflow.com/questions/41369633/how-to-save-to-local-storage-using-flutter