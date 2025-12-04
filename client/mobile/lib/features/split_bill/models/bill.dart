import 'package:sepurito/features/split_bill/models/participant.dart';

class Bill {
  final String id;
  final String title;
  final String category;
  final double total;
  final double tax;
  final double service;
  final List<Participant> participants;

  Bill({
    required this.id,
    required this.title,
    required this.category,
    required this.total,
    required this.tax,
    required this.service,
    required this.participants,
  });

  double calculateTotalPerParticipant(Participant participant) {
    double participantTotal = participant.total;
    double taxAmount = (tax / 100) * participantTotal;
    double serviceAmount = (service / 100) * participantTotal;
    return participantTotal + taxAmount + serviceAmount;
  }
}