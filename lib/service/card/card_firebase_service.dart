import 'dart:convert';

import 'package:bank_simulator/core/models/card_credit.dart';
import 'package:bank_simulator/core/utilities/api_constants.dart';
import 'package:http/http.dart' as http;

class CardFirebaseService {
  static List<CardCredit> cards = [];

  getCard() async {
    var url = "${ApiConstants.baseUrl}/card";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      for (var card in responseBody['documents']) {
        cards.add(CardCredit.fromJson(card));
      }
    }
  }
}
