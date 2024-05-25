class CardTransactions {
  late String id;
  late String name;
  late double price;
  late String type;
  late String startDate;
  late int installmentPayment;

  CardTransactions({
    required this.id,
    required this.name,
    required this.price,
    required this.type,
    required this.startDate,
    required this.installmentPayment,
  });

  CardTransactions.fromJson(Map<String, dynamic> json) {
    id = json['id']['stringValue'];
    name = json['name']['stringValue'];
    price = json['price']['doubleValue'];
    type = json['type']['stringValue'];
    startDate = json['start_date']['timestampValue'].toString();
    installmentPayment =
        int.parse(json['installment_payment']['integerValue'].toString());
  }
}
