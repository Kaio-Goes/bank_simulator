import 'package:intl/intl.dart';

String formatDate(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr);
  DateTime now = DateTime.now();
  DateFormat dateFormat = DateFormat("dd MMM", 'pt_BR');
  var date = dateFormat.format(dateTime);

  if (dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day) {
    return 'Hoje, ${capitalizeMonthAndRemoveDot(date)}';
  } else if (dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day - 1) {
    return 'Ontem, ${capitalizeMonthAndRemoveDot(date)}';
  } else {
    return capitalizeMonthAndRemoveDot(date);
  }
}

String formatDateHour(String startDate) {
  DateTime dateTime = DateTime.parse(startDate);
  return DateFormat('dd/MM \'às\' HH:mm').format(dateTime);
}

String capitalizeMonthAndRemoveDot(String data) {
  List<String> palavras = data.split(" ");
  palavras.last =
      "${palavras.last[0].toUpperCase()}${palavras.last.substring(1).replaceAll('.', '')}";
  return (palavras.join(" "));
}

String getMaskedCardNumber(String cardNumber) {
  if (cardNumber.length < 4) return cardNumber;
  return '●●●● ${cardNumber.substring(cardNumber.length - 4)}';
}

String getFormattedBalance(double balance) {
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt_BR');
  return formatCurrency.format(balance);
}
