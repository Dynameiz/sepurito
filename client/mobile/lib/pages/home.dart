import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:sepurito/components/history_tile.dart';
// import 'package:sepurito/features/split_bill/models/split_bill.dart';
import 'package:sepurito/pages/loading.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    // _history = dummySplitBills;
  }

  Future<File?> _getImage({required ImageSource source}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 100,
    );
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  void handleNavigation(File image) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Loading(image: image),
      ),
    );
  }

  Future _selectPhoto() async {
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF181818),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.of(context).pop();
                            final image = await _getImage(source: ImageSource.gallery);
                            if (image != null) {
                              handleNavigation(image);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              color: const Color(0xFF121212),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              border: Border.all(color: const Color(0xFF282828))
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.photo_library, size: 28, color: Color(0xFF2E9C6B)),
                                const SizedBox(height: 8),
                                Text('Gallery', style: GoogleFonts.mulish(fontWeight: FontWeight.w600, color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            _getImage(source: ImageSource.camera).then((image) {
                              if (image != null) {
                                handleNavigation(image);
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              color: const Color(0xFF121212),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              border: Border.all(color: const Color(0xFF282828))
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.camera_alt, size: 28, color: Color(0xFF2E9C6B)),
                                const SizedBox(height: 8),
                                Text('Camera', style: GoogleFonts.mulish(fontWeight: FontWeight.w600, color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E9C6B),
        title: Text('Home', style: GoogleFonts.mulish(color: Colors.white, fontWeight: FontWeight.bold),),
        leading: Image(image: AssetImage('assets/logo-white.png'), width: 24, height: 24,),
      ),
      backgroundColor: const Color(0xFF121212),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
              color: const Color(0xFF171717),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF282828)),
              boxShadow: [
                BoxShadow(
                color: const Color(0xFF2E9C6B).withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
                ),
              ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text("History", style: GoogleFonts.mulish(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ),

                Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  thickness: 0.0,
                  child:
                  Center(
                    child: Text("No history available", style: GoogleFonts.mulish(color: Colors.white),),
                  ), 
                  // ListView.builder(
                  // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  // itemCount: _history?.length ?? 0,
                  // itemBuilder: (context, index) {
                  //   final bill = _history![index];
                  //   return _history != null ? HistoryTile(history: bill) : Text("No history available", style: GoogleFonts.mulish(color: Colors.white),);
                  //   },
                  // ),
                ),
                ),
              ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          await _selectPhoto();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E9C6B),
          shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          fixedSize: const Size(64, 64),
          padding: EdgeInsets.zero,
        ),
        child: const Center(child: Icon(Icons.add_a_photo_outlined, color: Colors.white, size: 28)),
      ),
    );
  }
}