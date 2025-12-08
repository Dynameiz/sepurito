import 'item.dart';

class Participant {
  String id;
  String name;
  List<Item> items;

  Participant({
    required this.id,
    required this.name,
    this.items = const [],
  });

  double get totalBeforeTax =>
      items.fold(0, (sum, item) => sum + item.subtotal);

  double totalAfterTax = 0;
}
