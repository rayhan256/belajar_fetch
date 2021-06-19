part of 'services.dart';

class FetchData {
  static var url = "http://34.101.221.232:3001/api/v1";
  static var client = http.Client();

  static Future<dynamic> getAllStudies({String token}) async {
    var pathname = url + "/sentra_belajars/";
    var response = await client.get(pathname, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return studiesFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<dynamic> createStudies({
    String token,
    int userId,
    String title,
    String content,
  }) async {
    try {
      var body = jsonEncode({
        "title": "$title",
        "content": "$content",
        "user_id": "$userId",
        "image":
            "data:image/png;base64,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"
      });

      var pathname = url + "/sentra_belajars/create";
      var response = await client.post(pathname, body: body, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> getStudiesById({String token, int id}) async {
    var pathname = url + "/sentra_belajars/$id";
    var response = await client.get(pathname, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return studyDetailsFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<dynamic> updateStudies(
      {String token, int userId, String title, String content, int id}) async {
    var pathname = url + "/sentra_belajars/$id";
    var body = jsonEncode({
      "title": "$title",
      "content": "$content",
      "user_id": "$userId",
      "image":
          "data:image/png;base64,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"
    });
    var response = await client.patch(pathname, body: body, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}
