import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepurito/components/item_tile.dart';
import 'package:sepurito/components/participant_list.dart';
import 'package:sepurito/features/receipt/models/receipt.dart';
import 'package:sepurito/features/split_bill/models/participant.dart';

class SplitBillPage extends StatefulWidget {
  final Receipt receipt;

  const SplitBillPage({super.key, required this.receipt});

  @override
    State<SplitBillPage> createState() => _SplitBillPageState();
  }

  class _SplitBillPageState extends State<SplitBillPage> {
    List<Participant> participants = [
      Participant(name: "", isActive: true, items: []),
    ];

    int? activeIndex;

  void setActive(int index) {
    setState(() => activeIndex = index);
  }

  // void increaseQty(int index) {
  //   setState(() => widget.receipt.items[index].quantity++);
  // }

  // void decreaseQty(int index) {
  //   setState(() {
  //     if (widget.receipt.items[index].quantity > 1) {
  //       widget.receipt.items[index].quantity--;
  //     }
  //   });
  // }

  void editItem(int index) {
    // open modal or show bottom sheet
  }


  void confirmSplitBillPage() async {
    if (participants.every((p) => p.name.trim().isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter at least one participant name."),
        ),
      );
      return;
    }

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

    Navigator.pop(context, participants.map((p) => p.name.trim()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color(0xFF2E9C6B),
        title: Text(
          'Split Bill',
          style: GoogleFonts.mulish(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF121212),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ParticipantList(participants: participants),

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 16.0,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E1E1E),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF282828)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                style: GoogleFonts.mulish(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                onChanged: (value) {},
                                cursorColor: Color(0xFF00A67D),
                                decoration: InputDecoration(
                                  hintText: "Enter Title...",
                                  hintStyle: GoogleFonts.mulish(
                                    color: Colors.white54,
                                  ),
                                  border: InputBorder.none,
                                ),
                                
                              ),
                              const SizedBox(height: 12),
                              
                              ...List.generate(
                                widget.receipt.items.length,
                                (index) {
                                  final item = widget.receipt.items[index];
                                  return ItemTile(
                                    name: item.name,
                                    price: item.price,
                                    qty: item.quantity,
                                    isActive: activeIndex == index,
                                    onTap: () => setActive(index),
                                    onIncrease: () {},
                                    onDecrease: () {},
                                    onEdit: () {},
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

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
                            onPressed: confirmSplitBillPage,
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
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
