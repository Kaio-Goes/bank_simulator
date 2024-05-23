class CardCredit {
  late String id;
  late String name;
  late String number;
  late int paymentDueDate;
  late double availableBalance;

  CardCredit(
      {required this.id,
      required this.name,
      required this.number,
      required this.paymentDueDate,
      required this.availableBalance});

  CardCredit.fromJson(Map<String, dynamic> json) {
    id = json['fields']['id']['stringValue'];
    name = json['fields']['name']['stringValue'];
    number = json['fields']['number']['stringValue'];
    paymentDueDate = int.parse(
        json['fields']['payment_due_date']['integerValue'].toString());
    availableBalance = double.parse(
        json['fields']['available_balance']['doubleValue'].toString());
  }
}
