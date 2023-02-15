import 'package:intl/intl.dart';

extension CurrencyFormatExtension on double {
  String toCurrency() {
    final NumberFormat format = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: r'R$',
    );

    return format.format(this);
  }
}
