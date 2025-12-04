import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepurito/features/split_bill/models/bill.dart';
import 'package:sepurito/features/split_bill/models/item.dart';
import 'package:sepurito/features/split_bill/models/participant.dart';
import 'package:sepurito/pages/split_bill.dart';

class Loading extends StatelessWidget {
  final File image;

  const Loading({super.key, required this.image});

  Future<Bill> processOCR(File image) async {
    // Simulate OCR processing delay
    await Future.delayed(const Duration(seconds: 3));

    // Return a dummy Bill object after processing
    return Bill(
      id: '1',
      title: "Sample Bill",
      category: "Food",
      service: 5.0,
      tax: 11.0,
      total: 100000.0,
      participants: [
        Participant(
          name: "Alice",
          total: 50000.0,
          items: [Item(name: "Item 1", price: 50000.0, quantity: 1)],
        ),
        Participant(
          name: "Bob",
          total: 50000.0,
          items: [Item(name: "Item 2", price: 50000.0, quantity: 1)],
        ),
      ],
    );
  }

  Future<void> processImage(BuildContext context) async {
    final Bill bill = await processOCR(image);

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => SplitBill(bill: bill)));
  }

  @override
  Widget build(BuildContext context) {
    processImage(context);
    return Scaffold(
      backgroundColor: const Color(0xFF26282C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: Stream.periodic(
                const Duration(milliseconds: 16),
                (i) => i,
              ),
              builder: (context, snapshot) {
                final t = snapshot.data ?? 0;
                final angle = t * -0.015;
                return Transform.rotate(
                  angle: angle,
                  child: Image.asset(
                    'assets/logo.png',
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                );
              },
            ),
            Text(
              'Processing...',
              style: GoogleFonts.mulish(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
