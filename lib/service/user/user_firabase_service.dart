import 'dart:convert';

import 'package:bank_simulator/core/models/user_firabase.dart';
import 'package:bank_simulator/core/utilities/api_constants.dart';
import 'package:http/http.dart' as http;

class UserFirabaseService {
  static UserFirabase? _currentUser;

  UserFirabase? get currentUser {
    return _currentUser;
  }

  getUser(String id) async {
    var url = "${ApiConstants.baseUrl}/users/user";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      _currentUser = UserFirabase.fromJson(responseBody['fields']);
    }
  }
}
