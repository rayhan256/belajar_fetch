part of 'services.dart';

class AuthServices {
  static var url = "http://34.101.221.232:3000/api/v1/oauth";
  static var client = http.Client();

  static Future<dynamic> userLogin({String username, String password}) async {
    var pathname = url + "/token";
    var body = jsonEncode({"username": username, "password": password});
    var response = await client.post(pathname,
        headers: {
          "Content-Type": "application/json",
        },
        body: body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  static Future<dynamic> userVerify({String token}) async {
    var pathname = url + "/auth?token=$token";
    var response = await client.get(pathname);

    if (response.statusCode == 200) {
      return userVerifyFromJson(response.body);
    } else {
      return null;
    }
  }
}
