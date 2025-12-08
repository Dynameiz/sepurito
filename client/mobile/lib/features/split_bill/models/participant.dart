import 'package:uuid/uuid.dart';

class Participant {
  final String id;
  String name;
  bool isActive;
  
  double totalBeforeTax = 0.0; 
  double totalAfterTax = 0.0;  

  Participant({
    String? id,
    this.name = "",
    this.isActive = false,
  }) : id = id ?? const Uuid().v4();

  void resetTotals() {
    totalBeforeTax = 0.0;
    totalAfterTax = 0.0;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        id: json["id"],
        name: json["name"],
      );
}
