import 'package:flutter/material.dart';

class TableRadarLidarCamera extends StatelessWidget {
  const TableRadarLidarCamera({super.key});

  // Widget dla ikon/tekstu w komórkach tabeli
  Widget _buildCellContent(dynamic content, {Color? color}) {
    if (content is String) {
      // Jeśli to jest tekst (np. "Cecha")
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          content,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color ?? Colors.black, // Używa podanego koloru lub czarnego
            fontSize: 15,
          ),
        ),
      );
    } else if (content == '✓') {
      // Ikona "ptaszka" (zielona)
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Icon(Icons.check, color: Colors.green, size: 20),
      );
    } else if (content == '✕') {
      // Ikona "krzyżyka" (czerwona)
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Icon(Icons.close, color: Colors.red, size: 20),
      );
    } else if (content == '~') {
      // Ikona "tylda" (szara/żółta)
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          content,
          style: TextStyle(
            color: Colors.grey[700], // Kolor szary, jak na obrazku
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
    return const SizedBox(); // Zwraca pusty widget, jeśli dane są niepoprawne
  }

  // Buduje wiersz tabeli
  TableRow _buildRow(List<dynamic> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells.map((content) {
        return Center(
          child: _buildCellContent(
            content,
            // Jeśli to nagłówek, kolumna "Radar" ma niebieski kolor tekstu
            color: isHeader && content == 'Radar' ? Colors.blue : null,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.2), // Delikatny cień
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Nagłówek Tabeli
            const Text(
              'Porównanie: Kamera vs LIDAR vs Radar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // Właściwa Tabela
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2.5), // Kolumna Cecha szersza
                1: FlexColumnWidth(1.5),
                2: FlexColumnWidth(1.5),
                3: FlexColumnWidth(1.5),
              },
              border: TableBorder.symmetric(
                // Separator między nagłówkiem a resztą tabeli
                inside: const BorderSide(width: 0, color: Colors.transparent),
                // horizontal: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                // Wiersz Nagłówkowy
                _buildRow([
                  'Cecha',
                  'Kamera',
                  'LIDAR',
                  'Radar',
                ], isHeader: true),
                // --- Tutaj jest wizualny separator (linia) ---

                // Wiersze Danych
                _buildRow(['Deszcz/mgła', '✕', '~', '✓']),
                _buildRow(['Ciemność', '✕', '✓', '✓']),
                _buildRow(['Pomiar prędkości', '~', '~', '✓']),
                _buildRow(['Rozpoznawanie', '✓', '~', '✕']),
              ],
            ),

            const SizedBox(height: 16),

            // Podpis pod tabelą (Wyszarzony tekst)
            Text(
              'Radar wyróżnia się szczególnie w trudnych warunkach pogodowych i przy pomiarze prędkości',
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
