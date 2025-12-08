import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParticipantAvatar extends StatelessWidget {
  final bool isActive;
  final String name;
  final ValueChanged<String>? onNameChanged;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const ParticipantAvatar({
    super.key,
    required this.isActive,
    required this.onTap,
    required this.name,
    this.onNameChanged,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isActive
                  ? const RadialGradient(
                      colors: [Color(0xFF00FF66), Color(0xFF009944)],
                    )
                  : null,
            ),
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),


          SizedBox(
            width: 70,
            child: TextField(
              onChanged: onNameChanged,
              textAlign: TextAlign.center,
              cursorColor: Color(0xFF00A67D),
              textCapitalization: TextCapitalization.words,
              style: GoogleFonts.mulish(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Name",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
