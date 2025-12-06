import 'participant.dart';

enum BillCategory {
  food,
  groceries,
  travel,
  utilities,
  others,
}

class SplitBill {
  final String title;
  final List<Participant> participants;
  final double taxPercentage;
  final double servicePercentage;
  final BillCategory category;

  SplitBill({
    required this.title,
    required this.participants,
    required this.taxPercentage,
    required this.servicePercentage,
    required this.category,
  });

  double get totalBeforeCharges =>
      participants.fold(0, (sum, p) => sum + p.totalBeforeTax);

  double get taxAmount => (totalBeforeCharges * taxPercentage) / 100;

  double get serviceAmount =>
      (totalBeforeCharges * servicePercentage) / 100;

  double get grandTotal =>
      totalBeforeCharges + taxAmount + serviceAmount;

  void calculateParticipantTotals() {
    final totalBefore = totalBeforeCharges;

    for (var p in participants) {
      final ratio = p.totalBeforeTax / totalBefore;
      p.totalAfterTax =
          p.totalBeforeTax + taxAmount * ratio + serviceAmount * ratio;
    }
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "participants": participants.map((p) => p.toJson()).toList(),
        "taxPercentage": taxPercentage,
        "servicePercentage": servicePercentage,
        "category": category.name,
        "grandTotal": grandTotal,
      };

  factory SplitBill.fromJson(Map<String, dynamic> json) => SplitBill(
        title: json["title"],
        participants: (json["participants"] as List)
            .map((p) => Participant.fromJson(p))
            .toList(),
        taxPercentage: (json["taxPercentage"] as num).toDouble(),
        servicePercentage: (json["servicePercentage"] as num).toDouble(),
        category: BillCategory.values
            .firstWhere((c) => c.name == json["category"]),
      );
}
