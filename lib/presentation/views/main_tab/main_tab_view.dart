import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sample_app/controller/home_book_controller.dart';
import 'package:sample_app/presentation/custom_widgets/custom_drawer.dart';
import 'package:sample_app/presentation/custom_widgets/custom_tabbar.dart';
import 'package:sample_app/presentation/views/main_tab/physical_screen.dart';
import 'package:sample_app/presentation/views/mylibrary/mylibrary.dart';

@RoutePage()
class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  // bool isLoading = true;
  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const Mylibrary();
  List<String> tabs = ["Physical", "E-Book", "Audio Books"];
  List<String> items = ["Physical", "E-Book", "Audio Books"];
  List<IconData> icons = [
    FontAwesomeIcons.book,
    FontAwesomeIcons.bookAtlas,
    FontAwesomeIcons.bookBible
  ];

  List<Map<String, dynamic>> menuItems = [
    {
      "item": "Physical",
      "icon": FontAwesomeIcons.book,
    },
    {"item": "E-Book", "icon": FontAwesomeIcons.bookAtlas},
    {"item": "Audio Books", "icon": FontAwesomeIcons.bookBible}
  ];

  final homeController = HomeBookController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        backgroundColor: Colors.teal,
        menuItems: menuItems,
        userName: "Intelligent User",
      ),
      body: CustomTabbar(
        tabs: tabs,
        indicatorColor: Colors.amber,
        labelColor: Colors.white,
        screens: const [PhysicalScreen(), PhysicalScreen(), PhysicalScreen()],
      ),
    );
  }
}
