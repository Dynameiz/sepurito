import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepurito/components/item_tile.dart';
import 'package:sepurito/components/participant_list.dart';
import 'package:sepurito/features/receipt/models/receipt.dart';
import 'package:sepurito/features/split_bill/models/participant.dart';
import 'package:sepurito/features/split_bill/models/split_bill.dart';
import 'package:sepurito/features/split_bill/models/split_bill_item.dart';
import 'package:sepurito/pages/summary.dart';
import 'package:toastification/toastification.dart';

class SplitBillPage extends StatefulWidget {
  final Receipt receipt;

  const SplitBillPage({super.key, required this.receipt});

  @override
    State<SplitBillPage> createState() => _SplitBillPageState();
  }

  class _SplitBillPageState extends State<SplitBillPage> {
    List<Participant> participants = [
      Participant(name: "You", isActive: true),
    ];

    List<SplitBillItem> items = [];
    
    double taxPercentage = 0;
    double servicePercentage = 0;
    BillCategory category = BillCategory.undefined;

    late Participant activeParticipant;
    int? activeIndex;

    late final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    items = widget.receipt.items.map((r) => SplitBillItem(
      name: r.name,
      price: r.price,
      quantity: r.quantity,
    )).toList();


    activeParticipant = participants.first;

    super.initState();
  }

  void makeParticipantActive(int index) {
    setState(() {
      participants[index].isActive = true;
      participants[participants.indexOf(activeParticipant)].isActive = false;
      activeParticipant = participants[index];
    });
  }

  void renameParticipant(int index, String newName) {
    setState(() {
      participants[index].name = newName;
    });
  }

  void addParticipant() {
    setState(() {
      participants.add(Participant());
      makeParticipantActive(participants.length - 1);
    });
  }

  void deleteParticipant(int index) async {
    if (participants.length == 1) {
      toastification.show(
        title: Text(
          'At least 1 participant is required.',
          style: GoogleFonts.mulish(),
        ),
        autoCloseDuration: const Duration(seconds: 5),
      );
      return;
    }

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Remove participant?",
          style: GoogleFonts.mulish(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1E1E1E),
        content: Text(
          "This action cannot be undone.",
          style: GoogleFonts.mulish(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              "Cancel",
              style: GoogleFonts.mulish(color: Color(0xFFB0B0B0)),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Remove", style: GoogleFonts.mulish(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() {
      bool wasActive = participants[index].isActive;

      participants.removeAt(index);

      if (wasActive) {
        participants[0].isActive = true;
      }
    });
  }

  void setItemActive(int index) {
    setState(() => activeIndex = index);

    if(!items[index].participants.contains(activeParticipant)) {
      setState(() {
        items[index].participants.add(activeParticipant);
      });
    }

  }

  void editItem(int index) {
    
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

    SplitBill splitBill = SplitBill(
      title: _titleController.text.isEmpty ? "Untitled Split Bill" : _titleController.text,
      participants: participants,
      items: items,
      taxPercentage: taxPercentage,
      servicePercentage: servicePercentage,
      category: category,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Summary(splitBill: splitBill,),
      ),
    );
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
                      ParticipantList(
                        participants: participants,
                        isActive: activeParticipant,
                        addParticipant: addParticipant,
                        makeActive: makeParticipantActive,
                        deleteParticipant: deleteParticipant,
                        renameParticipant: renameParticipant,
                      ),

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
                                textCapitalization: TextCapitalization.words,
                                controller: _titleController,
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
                                items.length,
                                (index) {
                                  final item = items[index];
                                  return ItemTile(
                                    name: item.name,
                                    price: item.price,
                                    qty: item.quantity,
                                    isActive: activeIndex == index,
                                    onTap: () => setItemActive(index),
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
