import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BarcodeScannerService {
  Future<Map<String, String>?> scanBarcodeAndFetchBookDetails() async {
    try {
      var result = await BarcodeScanner.scan();
      if (result.type == ResultType.Barcode && result.rawContent.isNotEmpty) {
        return await fetchBookDetails(result.rawContent);
      } else {
        print("Invalid or empty barcode scanned.");
        return {
          "title": "No valid ISBN scanned",
          "author": "",
          "thumbnail": ""
        };
      }
    } catch (e) {
      print("Error scanning barcode: $e");
      return {"title": "Error scanning barcode", "author": "", "thumbnail": ""};
    }
  }

  Future<Map<String, String>> fetchBookDetails(String isbn) async {
    if (isbn.isEmpty || !RegExp(r'^\d{10}(\d{3})?$').hasMatch(isbn)) {
      return {"title": "Invalid ISBN", "author": "", "thumbnail": ""};
    }

    final url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?key=${dotenv.env['GOOGLE_BOOK_API_KEY']}&q=isbn:$isbn");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['totalItems'] > 0) {
          final volumeInfo = data['items'][0]['volumeInfo'];
          String title = volumeInfo['title'] ?? "Title not available";
          String author = (volumeInfo['authors'] != null &&
                  volumeInfo['authors'].isNotEmpty)
              ? (volumeInfo['authors'] as List).join(", ")
              : "Author not available";
          String thumbnail = volumeInfo['imageLinks']?['thumbnail'] ?? "";

          return {"title": title, "author": author, "thumbnail": thumbnail};
        } else {
          return {"title": "No results found", "author": "", "thumbnail": ""};
        }
      } else {
        print(
            "Failed to fetch book details. Status code: ${response.statusCode}");
        return {"title": "Failed to fetch data", "author": "", "thumbnail": ""};
      }
    } catch (e) {
      print("Error fetching book details: $e");
      return {"title": "Error fetching details", "author": "", "thumbnail": ""};
    }
  }
}
