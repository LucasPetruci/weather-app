import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MyDraggableScrollable extends StatelessWidget {
  final List<Map<String, dynamic>> forecastData;

  const MyDraggableScrollable({
    super.key,
    required this.forecastData,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.2,
        maxChildSize: 1.0,
        builder: (context, scrollController) {
          return ColoredBox(
            color: Colors.white,
            child: Column(
              children: [
                // Handle do Draggable Sheet
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // Lista de previsões
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: forecastData.length,
                    itemBuilder: (context, index) {
                      final item = forecastData[index];

                      // converter para od dias da semana
                      String dayOfWeek = _convertToDayOfWeek(item['dayOfWeek']);
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  dayOfWeek,
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(
                                  item['imgPath'],
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  '${item['temperature']}°C',
                                  style: GoogleFonts.lato(
                                    fontSize: 22,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                            index < forecastData.length - 1
                                ? const Divider(
                                    thickness: 1,
                                    color: Color.fromRGBO(231, 231, 231, 1),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _convertToDayOfWeek(String date) {
    final parsedDate = DateTime.parse(date);
    final formatter = DateFormat.EEEE('pt_BR'); // Formato longo do dia
    return formatter.format(parsedDate); // Ex: Segunda-feira
  }
}
