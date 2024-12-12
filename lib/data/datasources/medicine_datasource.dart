import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:sample_app/core/utils/api_utils.dart";

class MedicineDatasource {
  List<dynamic> medicines = [
    <String, List<String>>{
      "data": <String>[
        "Paracetamol",
        "Dolo",
        "Ibuprofen",
        "Aspirin",
        "Ciprofloxacin",
        "Amoxicillin",
        "Metronidazole",
        "Lorazepam",
        "Fexofenadine",
        "Loratadine",
        "Cetirizine",
        "Omeprazole",
        "Atorvastatin",
        "Simvastatin",
        "Clopidogrel",
        "Pantoprazole",
        "Losartan",
        "Ramipril",
        "Amlodipine",
        "Hydrochlorothiazide",
        "Levothyroxine",
        "Dexamethasone",
        "Diazepam",
        "Furosemide",
        "Tramadol",
        "Hydrocodone",
        "Methotrexate",
        "Prednisolone",
        "Gabapentin",
        "Zolpidem",
        "Sertraline",
        "Paroxetine",
        "Fluoxetine",
        "Amitriptyline",
        "Clonazepam",
        "Ranitidine",
        "Omeprazole",
        "Vitamin D",
        "Vitamin C",
        "Magnesium",
        "Calcium Carbonate",
        "Erythromycin",
        "Tetracycline",
        "Fluconazole",
        "Itraconazole",
        "Miconazole",
        "Chloroquine",
        "Hydrocortisone",
        "Bupropion",
        "Sildenafil",
        "Tamsulosin",
        "Methylprednisolone",
      ],
    }
  ];

  Future<List<dynamic>> fetchMedicineData() async {
    final dynamic data = await ApiUtils().getApi(
        baseUrl: dotenv.env["BaseUrl"]!,
        path: "/comments",
        query: {
          "postId": "1"
        }); // jsonplaceholder.typicode.com/comments?postId=1
    return medicines;
  }
}
