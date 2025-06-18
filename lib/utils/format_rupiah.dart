import 'package:intl/intl.dart';

String formatRupiah(dynamic angka) {
  return NumberFormat.currency(locale: 'id', symbol: 'Rp', decimalDigits: 0)
      .format(int.tryParse(angka.toString()) ?? 0);
}