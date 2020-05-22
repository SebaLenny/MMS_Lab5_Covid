import 'package:intl/intl.dart';

extension NumberParsing on int {
  String format() {
    final formatter = NumberFormat("#,##0", "pl-PL");
    return formatter.format(this);
  }
}
