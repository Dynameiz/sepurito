import 'dart:convert';
import 'dart:io';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:sepurito/features/receipt/models/receipt.dart';
import 'package:sepurito/pages/split_bill_page.dart';

class Loading extends StatefulWidget {
  final File image;

  const Loading({super.key, required this.image});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String _status = 'Initializing...';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      processImage();
    });
  }

  Future<String> _processOCR({required String imgPath}) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    setState(() {
      _status = 'Analyzing Receipt...';
    });

    final image = InputImage.fromFile(File(imgPath));
    final recognized = await textRecognizer.processImage(image);

    return recognized.text;
  }

  Map<String, dynamic>? _extractJson(String input) {
    final regex = RegExp(r'\{[\s\S]*\}');
    final match = regex.firstMatch(input);

    if (match == null) return null;

    try {
      return jsonDecode(match.group(0)!);
    } catch (_) {
      return null;
    }
  }

  Future<Map<String, dynamic>> _processLLM({required String ocrText}) async {

    final model = FirebaseAI.googleAI().generativeModel(
      model: 'gemini-2.5-flash-lite',
    );

    String prompt =
    """
    You are a receipt parser. Convert the OCR text into clean structured JSON.
    Currency: INDONESIAN RUPIAH (IDR)

    OCR Text:
    $ocrText

    Return ONLY this JSON structure:

    {
      "items": [
        {
          "name": string,
          "quantity": number,
          "price": number,
          "subtotal": number
        }
      ],
      "tax": number,
      "service": number,
      "total": number,
      "category": string
    }
    """;

    setState(() {
      _status = 'Processing Receipt Data...';
    });

    final response = await model.generateContent(
      [Content.text(prompt)],
    );

    setState(() {
      _status = 'Finalizing...';
    });

    final text = response.text ?? '{}';

    final cleanText = text
        .replaceAll("```json", "")
        .replaceAll("```", "")
        .trim();

    try {
      final decoded = jsonDecode(cleanText);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else {
        return {};
      }
    } catch (e) {
      final extracted = _extractJson(cleanText);
      return extracted ?? {};
    }
  }

  Future<Receipt> textExtraction(File image) async {
    final ocrText = await _processOCR(imgPath:  image.path);
    final receipt = await _processLLM(ocrText: ocrText);

    setState(() {
      _status = 'Finished';
    });

    return Receipt.fromJson(receipt);
  }

  Future<void> processImage() async {
    final receipt = await textExtraction(widget.image);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SplitBillPage(receipt: receipt)));
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 16),
            Text(
              _status,
              style: GoogleFonts.mulish(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
