import 'participant.dart';

class SplitBillItem {
  String name;
  int quantity;
  double price;

  List<Participant> participants;

  SplitBillItem({
    this.name = "",
    this.quantity = 1,
    this.price = 0.0,
    List<Participant>? participants,
  }) : participants = participants ?? [];

  double get total => price * quantity;

  double get pricePerParticipant {
    if (participants.isEmpty) return 0.0;
    return total / participants.length;
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "price": price,
        "participants": participants.map((p) => p.id).toList()
      };

  factory SplitBillItem.fromJson(Map<String, dynamic> json, List<Participant> allParticipants) {
    return SplitBillItem(
      name: json["name"],
      quantity: json["quantity"],
      price: (json["price"] as num).toDouble(),
      participants: (json["participants"] as List)
          .map((id) => allParticipants.firstWhere((p) => p.id == id))
          .toList(),
    );
  }
}
