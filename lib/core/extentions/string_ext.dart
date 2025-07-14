import 'package:intl/intl.dart';

extension StringExt on String {
  int get toIntegerFromText {
    final cleanedText = replaceAll(RegExp(r'[^0-9]'), '');
    final parsedValue = int.tryParse(cleanedText) ?? 0;
    return parsedValue;
  }

  String get toFormattedTime {
    final dateTime = DateTime.parse(this);
    return DateFormat('dd-MM HH:mm').format(dateTime);
  }

  String get toFormattedTimeOnly {
    final dateTime = DateTime.parse(this);
    return DateFormat('HH:mm').format(dateTime);
  }

  String get toFormattedDateOnly {
    final dateTime = DateTime.parse(this);
    return DateFormat('dd MMMM yyyy', 'id_ID').format(dateTime);
  }


  //currencyFormatRp
  String get currencyFormatRp {
    final parsedValue = int.tryParse(this) ?? 0;
    return NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp. ',
      decimalDigits: 0,
    ).format(parsedValue);
  }

  String get currencyFormatRpV2 {
    final parsedValue = int.tryParse(this) ?? 0;
    return NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 0,
    ).format(parsedValue);
  }

  int get toInt{
    return int.tryParse(this) ?? 0;
  }
}
