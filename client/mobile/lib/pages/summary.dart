import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepurito/features/split_bill/models/split_bill.dart';
import 'package:sepurito/features/summary/models/item.dart';
import 'package:sepurito/features/summary/models/participant.dart';
import 'package:sepurito/pages/home.dart';

class Summary extends StatefulWidget {

  final SplitBill splitBill;

  const Summary({super.key, required this.splitBill});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {

  late final TextEditingController _titleController = TextEditingController.fromValue(  
    TextEditingValue(
      text: widget.splitBill.title,
      selection: TextSelection.collapsed(offset: widget.splitBill.title.length),
    ),
  );
  List<Participant> participants = [];
  List<Item> items = [];

  @override
  void initState() {
    super.initState();

    participants = widget.splitBill.participants.map((p) => Participant(
      id: p.id,
      name: p.name,
      items: [
        ...widget.splitBill.items.where((i) => i.participants.contains(p)).map((i) => Item(
          name: i.name,
          price: i.price,
          quantity: i.quantity,
        )),
        
      ],
    )).toList();
  }

  void confirmSplitBillPage() async {
    
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Confirm split",
          style: GoogleFonts.mulish(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1E1E1E),
        content: Text(
          "Are you sure you want to confirm splitting the bill?",
          style: GoogleFonts.mulish(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              "Cancel",
              style: GoogleFonts.mulish(color: const Color(0xFFB0B0B0)),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              "Confirm",
              style: GoogleFonts.mulish(color: Color(0xFF00A67D)),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => Home()),
      (route) => false,  // remove stack
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color(0xFF2E9C6B),
        title: Text(
          'Summary',
          style: GoogleFonts.mulish(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF121212),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              style: GoogleFonts.mulish(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textCapitalization: TextCapitalization.words,
              cursorColor: Color(0xFF00A67D),
              decoration: InputDecoration(
                hintText: "Enter Title...",
                hintStyle: GoogleFonts.mulish(
                  color: Colors.white54,
                ),
                border: InputBorder.none,
              ),
              
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: participants.length,
                itemBuilder: (context, index) {
                  final participant = participants[index];
                  return Card(
                    color: const Color(0xFF1E1E1E),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            participant.name,
                            style: GoogleFonts.mulish(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(
                              color: Colors.white24,
                              thickness: 1,
                              height: 1,
                            ),
                          ),
                          ...participant.items.map((item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${item.name} x${item.quantity}',
                                  style: GoogleFonts.mulish(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Rp ${item.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                                  style: GoogleFonts.mulish(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )),
                          const SizedBox(height: 10),


                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: GoogleFonts.mulish(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Rp ${widget.splitBill.totalBeforeCharges.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                    style: GoogleFonts.mulish(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tax (${widget.splitBill.taxPercentage}%)",
                    style: GoogleFonts.mulish(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Rp ${widget.splitBill.taxAmount.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                    style: GoogleFonts.mulish(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Service (${widget.splitBill.servicePercentage}%)",
                    style: GoogleFonts.mulish(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Rp ${widget.splitBill.serviceAmount.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                    style: GoogleFonts.mulish(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Grand Total",
                    style: GoogleFonts.mulish(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Rp ${widget.splitBill.grandTotal.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                    style: GoogleFonts.mulish(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E9C6B),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () => confirmSplitBillPage(),
                  child: Text(
                    "Confirm",
                    style: GoogleFonts.mulish(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}