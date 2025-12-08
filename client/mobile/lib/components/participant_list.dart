import 'package:flutter/material.dart';
import 'package:sepurito/components/participant_avatar.dart';
import 'package:sepurito/features/split_bill/models/participant.dart';

// ignore: must_be_immutable
class ParticipantList extends StatefulWidget {
  List<Participant> participants;
  Participant isActive;
  final VoidCallback addParticipant;
  final Function(int) makeActive;
  final Function(int) deleteParticipant;
  final Function(int, String) renameParticipant;
  
  ParticipantList({super.key, this.participants = const [], required this.isActive, required this.addParticipant, required this.makeActive, required this.deleteParticipant, required this.renameParticipant});

  @override
  State<ParticipantList> createState() => _ParticipantListState();
}

class _ParticipantListState extends State<ParticipantList> {

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
                onTap: () => widget.makeActive(i),
                onLongPress: () => widget.deleteParticipant(i),
                onNameChanged: (String newName) => widget.renameParticipant(i, newName),
              ),
            ),
          ),
          const SizedBox(width: 12),

          GestureDetector(
            onTap: widget.addParticipant,
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
