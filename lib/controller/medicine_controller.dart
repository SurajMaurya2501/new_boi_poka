import "package:sample_app/data/datasources/medicine_datasource.dart";

class MedicineController {
  final MedicineDatasource medicineDatasrouce = MedicineDatasource();
  List<dynamic> medicines = [];

  Future<List<dynamic>> getMedicineData() async => medicines = await medicineDatasrouce.fetchMedicineData();
}
