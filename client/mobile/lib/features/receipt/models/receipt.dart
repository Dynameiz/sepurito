import 'package:sepurito/features/receipt/models/receipt_item.dart';

class Receipt {
  List<ReceiptItem> items;
  double tax;
  double service;
  double total;

  Receipt({
    this.items = const [],
    this.tax = 0.0,
    this.service = 0.0,
    this.total = 0.0,
  });

  factory Receipt.fromJson(Map<String, dynamic> json) {
    return Receipt(
      items: (json['items'] as List<dynamic>)
          .map((e) => ReceiptItem.fromJson(e))
          .toList(),
      tax: (json['tax'] ?? 0).toDouble(),
      service: (json['service'] ?? 0).toDouble(),
      total: (json['total'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'tax': tax,
      'service': service,
      'total': total,
    };
  }
}
