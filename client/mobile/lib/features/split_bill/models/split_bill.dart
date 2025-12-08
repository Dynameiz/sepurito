import 'participant.dart';
import 'split_bill_item.dart';

enum BillCategory {
  food,
  groceries,
  travel,
  utilities,
  others,
  undefined,
}

class SplitBill {
  final String title;
  final List<Participant> participants;
  final List<SplitBillItem> items;

  final double taxPercentage;
  final double servicePercentage;
  final BillCategory category;

  SplitBill({
    required this.title,
    required this.participants,
    required this.items,
    this.taxPercentage = 0,
    this.servicePercentage = 0,
    this.category = BillCategory.food,
  });

  double get totalBeforeCharges =>
      items.fold(0.0, (sum, item) => sum + item.total);

  double get taxAmount => totalBeforeCharges * taxPercentage / 100;

  double get serviceAmount => totalBeforeCharges * servicePercentage / 100;

  double get grandTotal => totalBeforeCharges + taxAmount + serviceAmount;

  void calculateParticipantTotals() {
    for (var p in participants) {
      p.resetTotals();
    }

    for (var item in items) {
      final share = item.pricePerParticipant;

      for (var p in item.participants) {
        p.totalBeforeTax += share;
      }
    }

    final totalBefore = totalBeforeCharges;

    for (var p in participants) {
      if (totalBefore == 0) continue;

      final ratio = p.totalBeforeTax / totalBefore;

      p.totalAfterTax = p.totalBeforeTax +
          taxAmount * ratio +
          serviceAmount * ratio;
    }
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "category": category.name,
        "taxPercentage": taxPercentage,
        "servicePercentage": servicePercentage,
        "participants": participants.map((p) => p.toJson()).toList(),
        "items": items.map((i) => i.toJson()).toList(),
      };

  factory SplitBill.fromJson(Map<String, dynamic> json) {
    final participants = (json["participants"] as List)
        .map((p) => Participant.fromJson(p))
        .toList();

    return SplitBill(
      title: json["title"],
      category: BillCategory.values
          .firstWhere((c) => c.name == json["category"]),
      taxPercentage: (json["taxPercentage"] as num).toDouble(),
      servicePercentage: (json["servicePercentage"] as num).toDouble(),
      participants: participants,
      items: (json["items"] as List)
          .map((i) => SplitBillItem.fromJson(i, participants))
          .toList(),
    );
  }
}
