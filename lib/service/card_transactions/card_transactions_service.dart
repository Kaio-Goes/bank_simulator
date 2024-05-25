import 'dart:convert';

import 'package:bank_simulator/core/models/card_transactions.dart';
import 'package:bank_simulator/core/utilities/api_constants.dart';
import 'package:http/http.dart' as http;

class CardTransactionsService {
  // No API Rest do Firestore é utilizado POST em vez de GET em query :)
  Future<List<CardTransactions>> getCardTransactions(String cardId) async {
    var url = "${ApiConstants.baseUrl}:runQuery";

    Map params = {
      "structuredQuery": {
        "from": [
          {"collectionId": "card_transactions"}
        ],
        "where": {
          "fieldFilter": {
            "field": {"fieldPath": "card_id"},
            "op": "EQUAL",
            "value": {"stringValue": cardId}
          }
        }
      }
    };

    var body = json.encode(params);

    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      List<CardTransactions> cardsTransactions = [];

      for (var cardTransaction in responseBody) {
        cardsTransactions.add(
            CardTransactions.fromJson(cardTransaction['document']['fields']));
      }
      return cardsTransactions;
    } else {
      throw Exception('Failed to load card Credit Trasactions list');
    }
  }
}
