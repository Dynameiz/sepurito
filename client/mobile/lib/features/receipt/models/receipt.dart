import 'package:sepurito/features/receipt/models/receipt_item.dart';

class Receipt {
  final List<ReceiptItem> items;
  final double tax;
  final double service;
  final double total;

  Receipt({
    required this.items,
    required this.tax,
    required this.service,
    required this.total,
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
