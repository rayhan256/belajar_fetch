part of 'services.dart';

class SetSharedPreferences {
  void setToken({String token}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString('token', token);
  }
}

class GetSharedPreferences {
  static Future<dynamic> getToken({String key}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String data = _pref.getString(key);
    return data;
  }
}
