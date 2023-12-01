import 'package:intl/intl.dart';

final List<String> monthNames = [
  'Января',
  'Февраля',
  'Марта',
  'Апреля',
  'Мая',
  'Июня',
  'Июля',
  'Августа',
  'Сентября',
  'Октября',
  'Ноября',
  'Декабря',
];

String convertDatetime(String date) {
  DateTime? dt = DateTime.tryParse(date);

  if (dt != null) {
    return '${dt.day} ${monthNames[dt.month - 1]},\n${DateFormat('HH:mm').format(dt)}';
  }
  return date;
}
