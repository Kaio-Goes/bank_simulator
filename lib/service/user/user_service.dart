import 'dart:convert';

import 'package:bank_simulator/core/models/user.dart';
import 'package:bank_simulator/core/utilities/api_constants.dart';
import 'package:http/http.dart' as http;

class UserService {
  static User? _currentUser;

  User? get currentUser {
    return _currentUser;
  }

  getUser() async {
    var url = "${ApiConstants.baseUrl}/users/user";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      _currentUser = User.fromJson(responseBody['fields']);
    }
  }
}
