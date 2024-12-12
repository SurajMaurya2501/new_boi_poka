import "package:auto_route/auto_route.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:sample_app/core/constants/app_colors.dart";
import "package:sample_app/presentation/custom_widgets/custom_bottom_nav.dart";
import "package:sample_app/presentation/custom_widgets/custom_button.dart";
import "package:sample_app/presentation/custom_widgets/custom_drawer.dart";
import "package:sample_app/presentation/custom_widgets/custom_tabbar.dart";

@RoutePage()
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> tabs = <String>[
    "Medicines",
    "Doctor",
    "Appointment",
  ];

  Widget page1 = Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Doctor"),
        CustomButton(
          onPressed: () {},
          buttonTitle: "Sample Button",
          iconName: Icons.abc,
        )
      ],
    ),
  );

  Widget page2 = Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Medicines"),
        CustomButton(
          onPressed: () {},
          buttonTitle: "Sample Button",
          iconName: Icons.abc,
          variant: "text",
        )
      ],
    ),
  );

  Widget page3 = const Center(
    child: Text("Appointment"),
  );

  List<IconData> icons = <IconData>[
    Icons.medical_information,
    Icons.medical_services_rounded,
    Icons.group,
  ];

  List<Map<String, dynamic>> menuItems = [
    {
      "icon": Icons.medical_information,
      "item": "Medicines",
    },
    {
      "icon": Icons.medical_services_rounded,
      "item": "Doctor",
    },
    {
      "icon": Icons.group,
      "item": "Appointment",
    }
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Doctor's Care",
          ),
          // centerTitle: true,
          // titleTextStyle: const TextStyle(
          //   // color: Colors.white,
          //   fontWeight: FontWeight.bold,
          //   fontSize: 16,
          // ),
          // backgroundColor: AppColors.primaryColor,
        ),
        drawer: CustomDrawer(
            backgroundColor: AppColors.primaryColor,
            menuItems: menuItems,
            userName: _auth.currentUser?.displayName ?? ""),
        body: CustomBottomNav(
          screens: [
            CustomTabbar(
              tabs: tabs,
              indicatorColor: AppColors.primaryColor,
              labelColor: Colors.white,
              screens: [page1, page2, page3],
            ),
            page2,
            page3
          ],
          activeColor: AppColors.primaryColor,
          tabBackgroundColor: Colors.white,
          color: Colors.black,
          items: menuItems,
          length: 3,
        ),
      );
}
