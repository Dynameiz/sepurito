import 'package:sepurito/features/split_bill/models/item.dart';
import 'package:sepurito/features/split_bill/models/participant.dart';
import 'package:sepurito/features/split_bill/models/split_bill.dart';

List<SplitBill> dummySplitBills = [
  // ─────────────────────────────── 1. Dinner Bill ───────────────────────────────
  (() {
    final participants = [
      Participant(
        name: "Satria",
        items: [
          Item(name: "Nasi Goreng Special", quantity: 1, pricePerPiece: 28000),
          Item(name: "Iced Lemon Tea", quantity: 1, pricePerPiece: 8000),
        ],
      ),
      Participant(
        name: "Dewi",
        items: [
          Item(name: "Ayam Geprek", quantity: 1, pricePerPiece: 25000),
          Item(name: "Iced Lemon Tea", quantity: 1, pricePerPiece: 8000),
        ],
      ),
      Participant(
        name: "Hendra",
        items: [
          Item(name: "Mineral Water", quantity: 1, pricePerPiece: 5000),
        ],
      ),
    ];

    final bill = SplitBill(
      title: "Dinner at Waroeng Mantap",
      participants: participants,
      taxPercentage: 7,
      servicePercentage: 5,
      category: BillCategory.food,
    );

    bill.calculateParticipantTotals();
    return bill;
  })(),

  // ─────────────────────────────── 2. Groceries Bill ───────────────────────────────
  (() {
    final participants = [
      Participant(
        name: "Andi",
        items: [
          Item(name: "Beras 5kg", quantity: 1, pricePerPiece: 72000),
          Item(name: "Minyak Goreng 2L", quantity: 1, pricePerPiece: 28000),
        ],
      ),
      Participant(
        name: "Lala",
        items: [
          Item(name: "Sabun Mandi", quantity: 2, pricePerPiece: 6000),
          Item(name: "Shampoo", quantity: 1, pricePerPiece: 18000),
        ],
      ),
    ];

    final bill = SplitBill(
      title: "Monthly Groceries",
      participants: participants,
      taxPercentage: 0,
      servicePercentage: 0,
      category: BillCategory.groceries,
    );

    bill.calculateParticipantTotals();
    return bill;
  })(),

  // ─────────────────────────────── 3. Ride-Share Bill ───────────────────────────────
  (() {
    final participants = [
      Participant(
        name: "Kevin",
        items: [
          Item(name: "GrabCar Fare", quantity: 1, pricePerPiece: 45000),
        ],
      ),
      Participant(
        name: "Mira",
        items: [
          Item(name: "GrabCar Fare", quantity: 1, pricePerPiece: 45000),
        ],
      ),
    ];

    final bill = SplitBill(
      title: "Ride to Airport",
      participants: participants,
      taxPercentage: 0,
      servicePercentage: 0,
      category: BillCategory.travel,
    );

    bill.calculateParticipantTotals();
    return bill;
  })(),
];
