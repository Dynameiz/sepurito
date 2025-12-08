class ReceiptItem {
  String name;
  int quantity;
  double price;

  ReceiptItem({
    this.name = '',
    this.quantity = 1,
    this.price = 0.0,
  });

  factory ReceiptItem.fromJson(Map<String, dynamic> json) {
    return ReceiptItem(
      name: json['name'] ?? '',
      quantity: (json['quantity'] ?? 1).toInt(),
      price: (json['price'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}