import 'package:intl/intl.dart';
import 'package:brasil_fields/brasil_fields.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(amount);
  }

  static String formatPhoneNumber(String number) {
    return UtilBrasilFields.obterTelefone(number);
  }

  static String formatCep(String cep) {
    return '(${cep.substring(0, 5)}-${cep.substring(5)}';
  }
}
