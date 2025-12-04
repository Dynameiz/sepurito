import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepurito/components/participant_avatar.dart';
import 'package:sepurito/features/split_bill/models/bill.dart';

class SplitBill extends StatefulWidget {
  final Bill bill;

  const SplitBill({super.key, required this.bill});

  @override
  State<SplitBill> createState() => _SplitBillState();
}

class _Participant {
  String name;
  bool isActive;

  _Participant({this.name = "", this.isActive = false});
}

class _SplitBillState extends State<SplitBill> {
  List<_Participant> participants = [_Participant(name: "", isActive: true)];

  void makeActive(int index) {
    setState(() {
      for (var i = 0; i < participants.length; i++) {
        participants[i].isActive = (i == index);
      }
    });
  }

  void addParticipant() {
    setState(() {
      participants.add(_Participant());
      makeActive(participants.length - 1);
    });
  }

  void deleteParticipant(int index) async {
    if (participants.length == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("At least 1 participant is required.")),
      );
      return;
    }

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Remove participant?", style: GoogleFonts.mulish(fontWeight: FontWeight.bold, color: Colors.white),  ),
        backgroundColor: const Color(0xFF1E1E1E),
        content: Text("This action cannot be undone.", style: GoogleFonts.mulish(color: Colors.white),),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Cancel", style: GoogleFonts.mulish(color: Color(0xFFB0B0B0)),),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Remove", style: GoogleFonts.mulish(color: Colors.red),),
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

  void confirmSplitBill() async {
    if (participants.every((p) => p.name.trim().isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter at least one participant name.")),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Confirm split",
          style: GoogleFonts.mulish(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1E1E1E),
        content: Text(
          "Are you sure you want to confirm splitting the bill?",
          style: GoogleFonts.mulish(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Cancel", style: GoogleFonts.mulish(color: const Color(0xFFB0B0B0))),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Confirm", style: GoogleFonts.mulish(color: Color(0xFF00A67D))),
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
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: constraints.maxHeight,
        ),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        participants.length,
                        (i) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ParticipantAvatar(
                            name: participants[i].name,
                            isActive: participants[i].isActive,
                            onTap: () => makeActive(i),
                            onLongPress: () => deleteParticipant(i),
                            onNameChanged: (newName) {
                              participants[i].name = newName;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      GestureDetector(
                        onTap: addParticipant,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white24,
                              ),
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                child: Icon(Icons.add, color: Colors.white, size: 30),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: 70,
                              child: Text(
                                "Add",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mulish(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF282828)),
                    ),
                    child: Text(
                      'Total Bill: \$${widget.bill.total.toStringAsFixed(2)}',
                      style: GoogleFonts.mulish(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
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
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                      ),
                      onPressed: confirmSplitBill,
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
