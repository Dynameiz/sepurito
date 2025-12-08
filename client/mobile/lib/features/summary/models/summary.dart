import 'participant.dart';

enum BillCategory {
  food,
  groceries,
  travel,
  utilities,
  others,
}

class Summary {
  final String title;
  final List<Participant> participants;
  final double taxPercentage;
  final double servicePercentage;
  final double total;
  final BillCategory category;

  Summary({
    required this.title,
    required this.participants,
    required this.taxPercentage,
    required this.servicePercentage,
    required this.total,
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
  
}
