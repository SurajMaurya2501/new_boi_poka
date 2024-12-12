import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:sample_app/core/constants/app_colors.dart";
import "package:sample_app/controller/medicine_controller.dart";

@RoutePage()
class ApiGetScreen extends StatefulWidget {
  const ApiGetScreen({super.key});

  @override
  State<ApiGetScreen> createState() => _ApiGetScreenState();
}

class _ApiGetScreenState extends State<ApiGetScreen> {
  final MedicineController _medicineController = MedicineController();
  bool isLoading = true;

  @override
  void initState() {
    _medicineController.getMedicineData().whenComplete(
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Material(
      color: Colors.white,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: _medicineController.medicines[0]['data'].length,
                itemBuilder: (context, index) {
                  String medicine =
                      _medicineController.medicines[0]['data'][index];
                  return ListTile(
                    leading: Icon(
                      FontAwesomeIcons.pills,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(medicine),
                  );
                },
              ),
            ),
    );

}
