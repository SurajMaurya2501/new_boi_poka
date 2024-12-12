import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/core/constants/app_colors.dart';
import 'package:sample_app/core/constants/app_routes.dart';
import 'package:sample_app/presentation/custom_widgets/custom_drawer.dart';
import 'package:sample_app/presentation/custom_widgets/tabbutton.dart';
import 'package:sample_app/presentation/views/analytic/analytic.dart';
import 'package:sample_app/presentation/views/community/community.dart';
import 'package:sample_app/presentation/views/main_tab/main_tab_view.dart';
import 'package:sample_app/presentation/views/scan/scanpage.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  Widget selectedScreen = MainTabView();
  String pageTitle = "MY LIBRARY";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  const Color.fromARGB(255, 60, 78, 193),
                ),
              ),
              onPressed: () {
                context.pushRoute(
                  PageRouteInfo(
                    AppRoutes.profile,
                  ),
                );
              },
              icon: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                ),
              ),
            ),
          )
        ],
      ),
      drawer: CustomDrawer(
          backgroundColor: AppColors.primaryColor,
          menuItems: [
            {"icon": Icons.book, "item": "My Library"}
          ],
          userName: "User"),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        height: 60,
        padding: EdgeInsets.only(bottom: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabButton(
              icon: Icons.book,
              isActive: _selectedIndex == 0,
              onTap: () {
                _selectedIndex = 0;
                getScreen();
              },
              label: 'MY LIBRARY',
            ),
            TabButton(
              icon: Icons.analytics,
              isActive: _selectedIndex == 1,
              onTap: () {
                _selectedIndex = 1;
                getScreen();
              },
              label: 'ANALYTIC',
            ),
            TabButton(
              icon: Icons.book,
              isActive: _selectedIndex == 2,
              onTap: () {
                _selectedIndex = 2;
                getScreen();
              },
              label: 'Books',
            ),
            TabButton(
              icon: Icons.person_2,
              isActive: _selectedIndex == 3,
              onTap: () {
                _selectedIndex = 3;
                getScreen();
              },
              label: 'COMMUNITY',
            ),
          ],
        ),
      ),
      body: selectedScreen,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(45),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                )
              ],
            ),
            child: const Align(
              child: Text(
                'ADD\nMETRIC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getScreen() {
    switch (_selectedIndex) {
      case 0:
        selectedScreen = MainTabView();
        pageTitle = "My Library";
        break;
      case 1:
        selectedScreen = Analytic();
        pageTitle = "Analytic";
        break;
      case 2:
        selectedScreen = ScanPage();
        pageTitle = "Books";
        break;
      case 3:
        selectedScreen = Community();
        pageTitle = "Community";
        break;
    }
    setState(() {});
  }
}
