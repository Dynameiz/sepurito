class Item {
  final String name;
  final int quantity;
  final double pricePerPiece;

  Item({
    required this.name,
    required this.quantity,
    required this.pricePerPiece,
  });

  double get subtotal => quantity * pricePerPiece;

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "pricePerPiece": pricePerPiece,
        "subtotal": subtotal,
      };

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        quantity: json["quantity"],
        pricePerPiece: (json["pricePerPiece"] as num).toDouble(),
      );
}
