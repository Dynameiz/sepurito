import 'item.dart';

class Participant {
  String name;
  bool isActive;
  List<Item> items;

  Participant({
    this.name = "",
    this.isActive = false,
    this.items = const [],
  });

  double get totalBeforeTax =>
      items.fold(0, (sum, item) => sum + item.subtotal);

  double totalAfterTax = 0;

  Map<String, dynamic> toJson() => {
        "name": name,
        "items": items.map((i) => i.toJson()).toList(),
        "totalAfterTax": totalAfterTax,
      };

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        name: json["name"],
        items: (json["items"] as List)
            .map((i) => Item.fromJson(i))
            .toList(),
      );
}
