import 'package:sample_app/controller/chatgpt_controller.dart';
import 'package:sample_app/core/constants/app_isbn.dart';

class ShelfController {
  final chatGpt = ChatgptController();

  Future<Map<String, dynamic>> checkIsbnLocally(
      String isbnNumber, String title, List<dynamic> author) async {
    if (AppIsbn.isbnList.contains(
      isbnNumber.trim().toString(),
    )) {
      for (Map<String, dynamic> data in AppIsbn.isbnData) {
        if (data["isbn"] == isbnNumber) {
          // log("ISBN DATA - ${data['data']}");
          return data['data'];
        }
      }
    } else {
      return await chatGpt.getChatResponse(
          '''Change positive, negative and neutral values with integers { book:"$title" ,authors: $author,
        popularity_country:{india : 50  // Add minimum 10 countries with name },
        book_read_mood:{joy : 10,melancholic : 30  // Add values based on book minimum 10},
        genres,
        themes,
        sentiment:{positive : integer value,neutral : integer value,negative : integer value },
         expert_reviews: [ {
            "name": "John Doe",
            "text": "A masterful blend of mythology and adventure.",
            "rating": 5
          },  //Add more values minimum 10
          ],
        fan_fiction:[{
            "author": "Luna Love good",
            "short_description":
                "An alternate journey of Frodo in Middle-earth.",
            "likes": 150
          } //Add more values minimum 10
          ]
         return only complete json code which can be decoded''');
    }
    return {};
  }
}
