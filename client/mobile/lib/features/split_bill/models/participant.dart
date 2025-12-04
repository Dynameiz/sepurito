import 'package:sepurito/features/split_bill/models/item.dart';

class Participant {
  final String name;
  final List<Item> items;
  final double total;

  Participant({
    required this.name,
    required this.items,
    required this.total,
  });
}