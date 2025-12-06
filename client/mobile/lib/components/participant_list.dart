import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepurito/components/participant_avatar.dart';
import 'package:sepurito/features/split_bill/models/participant.dart';
import 'package:toastification/toastification.dart';

// ignore: must_be_immutable
class ParticipantList extends StatefulWidget {
  List<Participant> participants;
  ParticipantList({super.key, this.participants = const []});

  @override
  State<ParticipantList> createState() => _ParticipantListState();
}

class _ParticipantListState extends State<ParticipantList> {
  void makeActive(int index) {
    setState(() {
      for (var i = 0; i < widget.participants.length; i++) {
        widget.participants[i].isActive = (i == index);
      }
    });
  }

  void addParticipant() {
    setState(() {
      widget.participants.add(Participant());
      makeActive(widget.participants.length - 1);
    });
  }

  void deleteParticipant(int index) async {
    if (widget.participants.length == 1) {
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
      bool wasActive = widget.participants[index].isActive;

      widget.participants.removeAt(index);

      if (wasActive) {
        widget.participants[0].isActive = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            widget.participants.length,
            (i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ParticipantAvatar(
                name: widget.participants[i].name,
                isActive: widget.participants[i].isActive,
                onTap: () => makeActive(i),
                onLongPress: () => deleteParticipant(i),
                onNameChanged: (newName) {
                  widget.participants[i].name = newName;
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
