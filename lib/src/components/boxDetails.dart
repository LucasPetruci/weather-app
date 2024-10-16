import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBoxDetails extends StatelessWidget {
  String path;
  String content;
  String text;

  MyBoxDetails({
    super.key,
    required this.path,
    required this.content,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 158,
      height: 132,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: const Color(0xFF3C72DC),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //icon
              Image.asset(
                path,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 4),
              Text(
                text,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                content,
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
