import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDraggableScrollable extends StatelessWidget {
  const MyDraggableScrollable({super.key});

  @override
  Widget build(BuildContext context) {
    String _imgPath = 'assets/icons/1.png';
    return Expanded(
      child: DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.2,
        maxChildSize: 0.8,
        builder: (context, scrollController) {
          return ColoredBox(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SingleChildScrollView(
                  controller: scrollController,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            "19/09",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            _imgPath,
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 20),
                          Text(
                            '22°C',
                            style: GoogleFonts.lato(
                                fontSize: 22, color: Colors.blue),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
