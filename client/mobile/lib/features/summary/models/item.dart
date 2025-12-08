class Item {
  final String name;
  final int quantity;
  final double price;

  Item({
    required this.name,
    required this.quantity,
    required this.price,
  });

  double get subtotal => quantity * price;

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "price": price,
        "subtotal": subtotal,
      };

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        quantity: json["quantity"],
        price: (json["price"] as num).toDouble(),
      );
}
