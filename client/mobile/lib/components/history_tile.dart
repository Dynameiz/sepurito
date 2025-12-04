import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepurito/features/split_bill/models/bill.dart';

class HistoryTile extends StatelessWidget {
  final Bill history;

  const HistoryTile({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: const Color(0xFF282828))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  history.title,
                  style: GoogleFonts.mulish(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text('Total: \$${history.total.toStringAsFixed(2)}',
                    style: GoogleFonts.mulish(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 0,
                padding: EdgeInsets.zero,
                minimumSize: const Size(36, 36),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Icon(Icons.more_vert, color: Colors.white, size: 24,
              )
            )
        ],
      ),
    );
  }
}